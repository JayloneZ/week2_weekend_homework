require 'minitest/autorun'
require 'minitest/rg'
require_relative '../rooms.rb'
require_relative '../guests.rb'
require_relative '../common_area.rb'

class TestRooms < Minitest::Test

  def setup()
    @guest1 = Guests.new("Yoni", 50, "Hips Don't Lie")
    @guest2 = Guests.new("Huascar", 30, "99 Luftbalons")
    @guest3 = Guests.new("Miguel", 25, "Dancing Queen")
    @room1 = Rooms.new("Latino Pop", 10)
    @room2 = Rooms.new("German Hits", 15)
    @room3 = Rooms.new("Swedish Pop", 3)
    @common_area = CommonArea.new([@guest1, @guest2, @guest3])
  end


  def test_room_name()
    name = @room3.name
    assert_equal("Swedish Pop", name)
  end

  def test_room_capacity()
    capacity = @room1.capacity
    assert_equal(10, capacity)
  end

  def test_add_guest_by_name()
    @room1.add_guest_by_name(@common_area, "Yoni")
    guests = @room1.guests
    assert_equal([@guest1], guests)
  end

  def test_remove_guest_by_name()
    @room1.add_guest_by_name(@common_area, "Yoni")
    @room1.remove_guest_by_name("Yoni")
    guests = @room1.guests
    assert_equal([], guests)
  end

end
