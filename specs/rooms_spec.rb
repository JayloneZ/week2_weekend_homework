require 'minitest/autorun'
require 'minitest/rg'
require_relative '../rooms.rb'

class TestRooms < Minitest::Test

  def setup()
    @room1 = Rooms.new(10)
    @room2 = Rooms.new(15)
  end


  def test_room_capacity
    capacity = @room1.capacity
    assert_equal(10, capacity)
  end

end
