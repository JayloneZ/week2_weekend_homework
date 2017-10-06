require 'minitest/autorun'
require 'minitest/rg'
require_relative '../rooms.rb'
require_relative '../guests.rb'
require_relative '../common_area.rb'
require_relative '../songs.rb'

class TestRooms < Minitest::Test

  def setup()
    @guest1 = Guests.new("Yoni", 50, "Hips Don't Lie")
    @guest2 = Guests.new("Huascar", 30, "99 Luftbalons")
    @guest3 = Guests.new("Miguel", 25, "Dancing Queen")
    @song1 = Songs.new("Hips Don't Lie", "Shakira")
    @song2 = Songs.new("99 Luftbalons", "Nena")
    @song3 = Songs.new("Dancing Queen", "ABBA")
    @room1 = Rooms.new("Latino Pop", 10)
    @room2 = Rooms.new("German Hits", 15)
    @room3 = Rooms.new("Swedish Pop", 3)
    @common_area = CommonArea.new([@guest1, @guest2, @guest3], [@song1, @song2, @song3])
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

  def test_remove_guest_by_name__guest_not_in_room()
    result = @room1.remove_guest_by_name("Yoni")
    assert_equal("This guest is not in this room", result)
  end

  def test_add_song_by_title()
    @room1.add_song_by_title(@common_area, "Hips Don't Lie")
    songs = @room1.songs
    assert_equal([@song1], songs)
  end

end
