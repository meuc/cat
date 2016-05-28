module Admin
  class ReservationsController < AdminController
    def index
      @reversations_on_dates = Reservation
        .where("starts_at > ?", Date.yesterday)
        .order(:starts_at).group_by do |reservation|
          reservation.starts_at.to_date
        end
    end
  end
end