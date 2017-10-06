class Rooms

attr_accessor :guests, :songs
attr_reader :capacity, :name
def initialize(name, capacity)
  @name = name
  @capacity = capacity
  @songs = []
  @guests = []
end


def add_guest_by_name(common_area, guest_name)
  for guest in common_area.guests
    if guest.name == guest_name
      self.guests.push(guest)
    end
  end
end

def remove_guest_by_name(guest_name)
  self.guests.each {|guest|
    if guest.name == guest_name
      self.guests.delete(guest)
    end
  }
end

end
