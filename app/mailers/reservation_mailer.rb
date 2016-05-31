class ReservationMailer < ApplicationMailer
  # Render and send booking confirmation email
  def confirmation_email(reservation)
    @reservation = reservation
    email = @reservation.email
    mail(to: email, subject: 'Your reservation at Catme!')
  end
end
