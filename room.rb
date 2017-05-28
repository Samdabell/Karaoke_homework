class Room

  def initialize(room_name, capacity, entry_fee)
    @room_name = room_name
    @capacity = capacity
    @entry_fee = entry_fee
    @songs = []
    @guests = []
  end

  def room_name()
    return @room_name
  end

  def capacity
    return @capacity
  end

  def amount_guests
    return @guests.count()
  end

  def add_guest(guest)
    if capacity > amount_guests
      if guest.money >= @entry_fee
        @guests << guest
        guest.spend(@entry_fee)
      else
        return "I'm sorry but the enrty fee is £3, you do not have enough money."
      end
    else
      return "I'm sorry this room is full, why not try a different one"
    end
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def amount_songs
    return @songs.count()
  end  

  def add_song(song)
    @songs << song
  end

  def add_songs_genre(genre, songs)
    for song in songs
      if genre == song.genre()
      @songs << song
      end
    end
  end

  def find_song(title)
    for song in @songs
      if song.title == title
      return "#{song.title}, #{song.artist}"
      end
    end
  end

end