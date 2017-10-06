require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guests.rb'
require_relative '../karaoke_bar.rb'
require_relative '../bar_tab.rb'

class TestKaraokeBar < Minitest::Test

  def setup()
    @guest1 = Guests.new("Yoni", 50, "Hips Don't Lie")
    @guest2 = Guests.new("Huascar", 30, "99 Luftbalons")
    @guest3 = Guests.new("Miguel", 25, "Dancing Queen")
    @bar_tab = BarTab.new()
    @karaoke_bar = KaraokeBar.new([@guest1, @guest2, @guest3], [], @bar_tab)
  end


  def test_guests_in_bar()
    guests = @karaoke_bar.guests
    assert_equal([@guest1, @guest2, @guest3], guests)
  end

  def test_bar_tab()
    bar_tab = @karaoke_bar.bar_tab
    assert_equal(30, bar_tab)
  end

end
