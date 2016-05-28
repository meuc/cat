class ReservationsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @reservation = @cat.reservations.new
  end
  
  def create
    # {"utf8"=>"✓", "authenticity_token"=>"3CMooEla+vsD+XdZSK3PmnH/DbdvRFrRDRYlLyVZqdVe+VSsw6Ogxuk4FjUsvlteJo0/zg+esOL4Tbfhweucsg==", "reservation"=>{"name"=>"Marie Crabit", "email"=>"mar.rie.cra@gmail.com", "starts_at"=>"2016-05-29 02:00:00 +0200"}, "commit"=>"Create Reservation", "cat_id"=>"5"}
    cat = Cat.find(params[:cat_id])
    
    reservation_params = params.require(:reservation).permit(:name, :email, :starts_at)
    @reservation = cat.reservations.new(reservation_params)
    
    if @reservation.save
      ReservationMailer.confirmation_email(@reservation).deliver_later
      flash.notice = "Check your email for your reservation info!"
      redirect_to cat
    else
      # Render "new" template:
      render :new
    end
  end
end
