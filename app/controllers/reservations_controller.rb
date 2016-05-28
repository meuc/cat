class ReservationsController < ApplicationController
  def new
    @cat = Cat.find(params[:cat_id])
    @reservation = @cat.reservations.new
  end
  
  def create
    
  end
end
