class Rooms

attr_accessor :guests, :songs
attr_reader :capacity, :name
def initialize(name, capacity)
  @name = name
  @capacity = capacity
  @songs = []
  @guests = []
end

def add_guests(guest)
  self.guests.push(guest)
end

end
