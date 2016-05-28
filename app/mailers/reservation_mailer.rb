class ReservationMailer < ApplicationMailer
  def confirmation_email(reservation)
    @reservation = reservation
    email = @reservation.email
    mail(to: email, subject: 'Your reservation at Catme!')
  end
end
