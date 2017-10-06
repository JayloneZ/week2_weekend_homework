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
        if self.guests.length == capacity
          return "This room has reached capacity"
        else
          self.guests.push(guest)
        end
      end
      if self.songs.include?(guest.favorite_song)
        return "This room has my favorite song!"
      end
    end
  end

  def remove_guest_by_name(guest_name)
    for guest in guests.each
      if guest.name == guest_name
        self.guests.delete(guest)
      end
    end
    return "This guest is not in this room"
  end

  def add_song_by_title(common_area, song_title)
    for song in common_area.songs
      if song.title == song_title
        self.songs.push(song)
      end
    end
  end

end
