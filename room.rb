class Room

  def initialize(room_name, capacity)
    @room_name = room_name
    @capacity = capacity
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
      @guests << guest
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

end