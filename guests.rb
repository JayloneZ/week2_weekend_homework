class Guests

attr_reader :favorite_song
attr_accessor :money
def initialize(money, favorite_song)
  @money = money
  @favorite_song = favorite_song
end


end
