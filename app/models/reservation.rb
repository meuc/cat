class Reservation < ActiveRecord::Base
  DURATION = 30.minutes
  
  validates :cat_id, :starts_at, :name, :email, presence: true
  
  belongs_to :cat, required: true
  
  # The time the reservation ends at
  def ends_at
    starts_at + DURATION
  end
end
