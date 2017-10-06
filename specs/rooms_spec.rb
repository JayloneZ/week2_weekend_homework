require 'minitest/autorun'
require 'minitest/rg'
require_relative '../rooms.rb'
require_relative '../guests.rb'

class TestRooms < Minitest::Test

  def setup()
    @guest1 = Guests.new("Yoni", 50, "Hips Don't Lie")
    @guest2 = Guests.new("Huascar", 30, "99 Luftbalons")
    @guest3 = Guests.new("Miguel", 25, "Dancing Queen")
    @room1 = Rooms.new("Latino Pop", 10)
    @room2 = Rooms.new("German Hits", 15)
    @room3 = Rooms.new("Swedish Pop", 3)
  end


  def test_room_name()
    name = @room3.name
    assert_equal("Swedish Pop", name)
  end

  def test_room_capacity()
    capacity = @room1.capacity
    assert_equal(10, capacity)
  end

  def test_add_guests()
    @room1.add_guests(@guest1)
    guests = @room1.guests
    assert_equal([@guest1], guests)
  end

end
