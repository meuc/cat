class Cat < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  
  validates :name, presence: true

  # Attach cat image
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  # Compute open time slots for cat reservation
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
    
    # Remove taken/past timeframes
    slots.reject do |slot|
      Reservation.exists?(cat: self, starts_at: slot.starts_at) || slot.starts_at.past?
    end
  end
  
  # Render open time slots
  def open_slots_for_select(date)
    open_slots(date).map do |slot|
      ["#{slot.starts_at.strftime('%d/%m/%Y, %H:%M ')}", slot.starts_at]
    end
  end
end
