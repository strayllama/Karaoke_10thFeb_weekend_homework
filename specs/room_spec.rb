require("minitest/autorun")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    song1 = Song.new("Mr Bright Side", "Killers")
    song2 = Song.new("Yellow Submarine", "Beetles")
    song3 = Song.new("Du Hast", "Ramstien")
    @song4 = Song.new("Tiny Dancer", "Elton John")
    @song_list = [ song1, song2, song3 ]
    @room1 = Room.new(2, 100, 40, @song_list)
    @guest1 = Guest.new("Knut Erik", 1000, @song1)
    @guest2 = Guest.new("Per Anre", 3000, @song3)
    @guest3 = Guest.new("Stevie Wonder", 9900, @song2)
  end

  def test_room_has_capacity()
    assert_equal( 2, @room1.capacity()) # test 1
  end

  def test_room_has_till()
    assert_equal( 100, @room1.till()) # test 2
  end

  def test_room_has_song_list()
    assert_equal(@song_list, @room1.song_list())  # test 3
  end

  def test_add_guest_to_room()
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    occupant_name_list = []
    @room1.occupants.each { |person| occupant_name_list << person.name() }
    assert_equal(["Knut Erik", "Per Anre"], occupant_name_list) # test 4
  end

  def test_remove_guest_from_room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest(@guest2)
    occupant_name_list = []
    @room1.occupants.each { |person| occupant_name_list << person.name() }
    assert_equal(["Knut Erik"], occupant_name_list) # test 5
  end

  def test_room_has_fee()
    assert_equal(40, @room1.room_fee()) # test 6
  end

  def test_room_collect_guest_fee()
    @room1.collect_guest_fee(@guest1)
    assert_equal(140, @room1.till)  # test 7
    assert_equal(960, @guest1.money())  # test 8
  end

  def test_add_song_to_room()
    @song_list << @song4
    @room1.add_song(@song4)
    assert_equal(@song_list, @room1.song_list()) # test 9
  end

  def test_add_guest_to_room__refused_as_full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    assert_equal([@guest1, @guest2], @room1.occupants()) # test 10
  end



end # end CLASS ROOM TEST
