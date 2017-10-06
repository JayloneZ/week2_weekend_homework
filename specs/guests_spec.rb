require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guests.rb'

class TestGuests < Minitest::Test

  def setup()
    @guest1 = Guests.new(50, "Hips Don't Lie")
    @guest2 = Guests.new(30, "99 Luftbalons")
  end


  def test_guest_money
    money = @guest1.money
    assert_equal(50, money)
  end

  def test_favorite_song
    favorite_song = @guest2.favorite_song
    assert_equal("99 Luftbalons", favorite_song)
  end

end
