class KaraokeBar

attr_accessor :guests, :songs, :bar_tab
def initialize(guests, songs, bar_tab)
  @guests = guests
  @songs = songs
  @bar_tab = bar_tab.money + (self.guests.length * 10)
end

end
