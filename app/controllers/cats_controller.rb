class CatsController < ApplicationController
  http_basic_authenticate_with name: "catlover", password: "123", except: [:index, :show]
  
  def index
    @cats = Cat.all
  end
  
  def new
    @cat = Cat.new
  end
  
  def create
    cat_params = params.require(:cat).permit(:name, :male, :birthdate, :image_url, :description)
    @cat = Cat.new(cat_params)
    
    if @cat.save
      redirect_to @cat
    else
      # Render "new" template:
      render :new
    end
  end
  
  def show
    @cat = Cat.find(params[:id])
  end
  
  def edit
    @cat = Cat.find(params[:id])
  end
  
  def update
    cat_params = params.require(:cat).permit(:name, :male, :birthdate, :image_url, :description)
    @cat = Cat.find(params[:id])
    
    if @cat.update(cat_params)
      redirect_to @cat
    else
      # Render "edit" template:
      render :edit
    end
  end
  
  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    redirect_to cats_path
  end
end


=begin
class Reservations < ActiveRecord::Base
  belongs_to :cat
  # starts_at :datetime
end

class Cat < ActiveRecord::Base
  def open_slots(date)
    time = date.to_time
    
    slots = []
    prev_time = time - 30.minutes
    loop do
      start_time = prev_time + 30.minutes
      
      if start_time.to_date == date
        slots << Slot.new(start_time)
        prev_time = start_time
      else
        break
      end
    end
    
    slots.reject do |slot|
      Reservation.where(cat: self, starts_at: slot.starts_at).present?
    end
  end
end

cat = Cat.find(params[:id])
slots = cat.open_slots(Date.today)
slots.each do |slot|
  slot.starts_at
  slot.ends_at
  slot.reserve(name: "David", email: "david@internet.com")
end
=end





