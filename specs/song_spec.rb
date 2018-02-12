require("minitest/autorun")
require_relative("../song.rb")

class SongTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Mr Bright Side", "Killers")
  end

  def test_song_has_title()
    assert_equal("Mr Bright Side", @song1.title)
  end

  def test_song_has_artist()
    assert_equal("Killers", @song1.artist)
  end

end # end CLASS SONG TEST
