require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guests.rb'
require_relative '../common_area.rb'

class TestCommonArea < Minitest::Test

  def setup()
    @guest1 = Guests.new("Yoni", 50, "Hips Don't Lie")
    @guest2 = Guests.new("Huascar", 30, "99 Luftbalons")
    @guest3 = Guests.new("Miguel", 25, "Dancing Queen")
    @commonarea = CommonArea.new([@guest1, @guest2, @guest3])
  end


  def test_waiting_guests()
    guests = @commonarea.guests
    assert_equal([@guest1, @guest2, @guest3], guests)
  end

end
