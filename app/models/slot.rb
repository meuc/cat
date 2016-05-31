class Slot
  def initialize(starts_at:, cat:)
    @starts_at = starts_at
    @cat = cat
  end
  
  attr_reader :starts_at
  
  # The time the slot ends
  def ends_at
    @starts_at + Reservation::DURATION
  end
  
  # Create reservation with given `name` and `email`
  def reserve(name:, email:)
    Reservation.create!(name: name, email: email, cat: @cat, starts_at: @starts_at)
  end
end