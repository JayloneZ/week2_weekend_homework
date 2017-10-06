require 'minitest/autorun'
require 'minitest/rg'
require_relative '../rooms.rb'
require_relative '../guests.rb'
require_relative '../karaoke_bar.rb'
require_relative '../songs.rb'
require_relative '../bar_tab.rb'

class TestRooms < Minitest::Test

  def setup()
    @song1 = Songs.new("Hips Don't Lie", "Shakira")
    @song2 = Songs.new("99 Luftbalons", "Nena")
    @song3 = Songs.new("Dancing Queen", "ABBA")
    @guest1 = Guests.new("Yoni", 50, @song1)
    @guest2 = Guests.new("Huascar", 3, @song2)
    @guest3 = Guests.new("Miguel", 25, @song3)
    @room1 = Rooms.new("Latino Pop", 2)
    @room2 = Rooms.new("German Hits", 3)
    @room3 = Rooms.new("Swedish Pop", 3)
    @bar_tab = BarTab.new()
    @karaoke_bar = KaraokeBar.new([@guest1, @guest2, @guest3], [@song1, @song2, @song3], @bar_tab)
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
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    guests = @room1.guests
    assert_equal([@guest1], guests)
  end

  def test_remove_guest_by_name()
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    @room1.remove_guest_by_name("Yoni")
    guests = @room1.guests
    assert_equal([], guests)
  end

  def test_remove_guest_by_name__guest_not_in_room()
    result = @room1.remove_guest_by_name("Yoni")
    assert_equal("This guest is not in this room", result)
  end

  def test_add_song_by_title()
    @room1.add_song_by_title(@karaoke_bar, "Hips Don't Lie")
    songs = @room1.songs
    assert_equal([@song1], songs)
  end

  def test_room_capacity()
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    @room1.add_guest_by_name(@karaoke_bar, "Miguel")
    result = @room1.add_guest_by_name(@karaoke_bar, "Huascar")
    assert_equal("This room has reached capacity", result)
  end

  def test_favorite_song_exclaim()
    @room1.add_song_by_title(@karaoke_bar, "Hips Don't Lie")
    result = @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    assert_equal("This room has my favorite song!", result)
  end

  def test_guest_pays_to_enter_room()
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    result = @guest1.money
    assert_equal(45, result)
  end

  def test_guest_pays_to_enter_room__bar_earns_money()
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    result = @karaoke_bar.bar_tab
    assert_equal(35, result)
  end

  def test_guest_is_broke()
    result = @room1.add_guest_by_name(@karaoke_bar, "Huascar")
    assert_equal("Guest is broke", result)
  end

  def test_guest_is_already_in_room()
    @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    result = @room1.add_guest_by_name(@karaoke_bar, "Yoni")
    assert_equal("Guest is already in the room", result)
  end

end
