class Rooms

  attr_accessor :guests, :songs
  attr_reader :capacity, :name
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @songs = []
    @guests = []
  end


  def add_guest_by_name(karaoke_bar, guest_name)
    for guest in karaoke_bar.guests
      if guest.name == guest_name
        if self.guests.length == capacity
          return "This room has reached capacity"
        elsif guest.money < 5
          return "Guest does not have enough money to enter this room"
        else
          guest.money -= 5
          karaoke_bar.bar_tab += 5
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

  def add_song_by_title(karaoke_bar, song_title)
    for song in karaoke_bar.songs
      if song.title == song_title
        self.songs.push(song)
      end
    end
  end

end
