class Reservation < ActiveRecord::Base
  DURATION = 30.minutes
  
  belongs_to :cat, required: true
  
  def ends_at
    starts_at + DURATION
  end
end
