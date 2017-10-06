require 'minitest/autorun'
require 'minitest/rg'
require_relative '../songs.rb'

class TestSongs < Minitest::Test

  def setup()
    @song1 = Songs.new("Hips Don't Lie", "Shakira")
    @song2 = Songs.new("99 Luftbalons", "Nena")
  end


  def test_song_title
    title = @song1.title
    assert_equal("Hips Don't Lie", title)
  end

  def test_song_artitst
    artist = @song2.artist
    assert_equal("Nena", artist)
  end

end
