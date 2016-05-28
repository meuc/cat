require 'test_helper'

class CatTest < ActiveSupport::TestCase
  test "create valid cat" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    cat.save
    assert_equal 1, Cat.count
  end
  
  test "create invalid, nameless cat" do
    cat = Cat.new(male: true, birthdate: Date.today)
    
    assert_raise ActiveRecord::StatementInvalid do
      cat.save
    end    
  end
  
  test "returns 48 open slots for a completely open day" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    slots = cat.open_slots(Date.today)
    
    assert_equal 48, slots.count
  end
  
  test "only returns slots starting on the given date" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    slots = cat.open_slots(Date.today)
    dates = slots.map(&:starts_at).map(&:to_date).uniq
    
    assert_equal [Date.today], dates
  end
  
  test "last slot ends on midnight of the next day" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    slots = cat.open_slots(Date.today)
    last_slot = slots.last
    
    assert_equal (Time.now + 1.day).change(hour: 0, min: 0), last_slot.ends_at
  end
  
  test "making reservations" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    slot = cat.open_slots(Date.today).first
    
    reservation = slot.reserve(name: "David", email: "david@example.com")
    
    assert_equal 1, Reservation.count
    assert_equal cat, reservation.cat
    assert_equal "David", reservation.name
    assert_equal "david@example.com", reservation.email
    assert_equal slot.starts_at, reservation.starts_at
    assert_equal slot.ends_at, reservation.ends_at
  end
  
  test "doesn't return slots that are reserved" do
    cat = Cat.new(name: "Cat", male: false, birthdate: Date.today)
    cat.open_slots(Date.today).each do |slot|
      slot.reserve(name: "David", email: "david@example.com")
    end
    
    open_slots = cat.open_slots(Date.today)
    
    assert_equal 0, open_slots.count
  end
end