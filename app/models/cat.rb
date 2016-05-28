class Cat < ActiveRecord::Base
  has_many :reservations
  def open_slots(date)
    time = date.to_time
    
    slots = []
    prev_time = time - 30.minutes
    loop do
      start_time = prev_time + 30.minutes
      
      if start_time.to_date == date
        slots << Slot.new(starts_at: start_time, cat: self)
        prev_time = start_time
      else
        break
      end
    end
    
    slots.reject do |slot|
      Reservation.exists?(cat: self, starts_at: slot.starts_at)
    end
  end
end
