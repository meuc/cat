class ReservationsController < ApplicationController
  # Render new reservation template
  def new
    @cat = Cat.find(params[:cat_id])
    @reservation = @cat.reservations.new
  end
  
  # Create a new cat reservation
  def create
    cat = Cat.find(params[:cat_id])
    
    reservation_params = params.require(:reservation).permit(:name, :email, :starts_at)
    @reservation = cat.reservations.new(reservation_params)
    
    if @reservation.save
      # Send confiramtion email on successful booking
      ReservationMailer.confirmation_email(@reservation).deliver_later
      
      flash.notice = "Check your email for your reservation info!"
      redirect_to cat
    else
      render :new
    end
  end
end
