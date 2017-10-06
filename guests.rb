class Guests

attr_reader :favorite_song, :name
attr_accessor :money
def initialize(name, money, favorite_song)
  @name = name
  @money = money
  @favorite_song = favorite_song
end

end
