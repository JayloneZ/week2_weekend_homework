require 'minitest/autorun'
require 'minitest/rg'
require_relative '../bar_tab.rb'

class TestBarTab < Minitest::Test

  def setup()
    @bar_tab = BarTab.new()
  end


  def test_bar_tab_money()
    result = @bar_tab.money
    assert_equal(0, result)
  end


end
