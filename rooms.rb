class Rooms

attr_accessor :guests, :songs
attr_reader :capacity
def initialize(capacity)
  @capacity = capacity
  @songs = []
  @guests = 0
end

end
