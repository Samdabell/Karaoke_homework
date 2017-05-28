require("minitest/autorun")
require("minitest/rg")

require_relative("../song")

class TestSong < MiniTest::Test

  def setup()
    @song_1 = Song.new("Digital Bath", "Deftones", "Rock")
  end

  def test_get_title
    assert_equal("Digital Bath", @song_1.title())
  end

  def test_get_artist
    assert_equal("Deftones", @song_1.artist())
  end

  def test_get_genre
    assert_equal("Rock", @song_1.genre())
  end
end