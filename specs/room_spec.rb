require("minitest/autorun")
require("minitest/rg")

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < MiniTest::Test

  def setup()
    @room1 = Room.new("Hip Hop Hits", 2, 3)
    @room2 = Room.new("Indie Classics", 5, 4)


    @song1 = Song.new("HUMBLE.", "Kendrick Lamar", "Hip Hop")
    @song2 = Song.new("Antidote", "Travis Scott", "Hip Hop")
    @song3 = Song.new("Hands on the Wheel", "Schoolboy Q", "Hip Hop")
    @song4 = Song.new("My Number", "Foals", "Indie")
    @song5 = Song.new("Take Me Out", "Franz Ferdinand", "Indie")
    @song6 = Song.new("Disco 2000", "Pulp", "Indie")

    @songs = [@song1, @song2, @song3, @song4, @song5, @song6]
    
    @guest1 = Guest.new("Sam", 10)
    @guest2 = Guest.new("Colin", 14)
    @guest3 = Guest.new("Chris", 23)
    @guest4 = Guest.new("Stuart", 2)
    @guest5 = Guest.new("Jia", 3)

  end

  def test_get_room_name()
    assert_equal("Hip Hop Hits", @room1.room_name())
  end

  def test_get_room_capacity()
    assert_equal(2, @room1.capacity)
  end

  def test_num_guests_in_room()
    assert_equal(0, @room1.amount_guests())
  end

  def test_add_guests_to_room()
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.amount_guests())
    assert_equal(7, @guest1.money())
  end

  def test_remove_guest_from_room()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest(@guest1)
    assert_equal(1, @room1.amount_guests())
  end

  def test_not_enough_money()
    assert_equal("I'm sorry but the enrty fee is £3, you do not have enough money." ,@room1.add_guest(@guest4))
  end

  def test_full_room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal("I'm sorry this room is full, why not try a different one", @room1.add_guest(@guest3))
  end

  def test_num_songs_in_room()
    assert_equal(0, @room1.amount_songs())
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(1, @room1.amount_songs())
  end

  def test_add_songs_by_genre()
    @room1.add_songs_genre("Hip Hop", @songs)
    assert_equal(3, @room1.amount_songs())
  end

  def test_search_songs_in_room()
    @room2.add_songs_genre("Indie", @songs)
    assert_equal("Disco 2000, Pulp", @room2.find_song("Disco 2000"))
  end
end