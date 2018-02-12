require("minitest/autorun")
require_relative("../guest.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Mr Bright Side", "Killers")
    @guest1 = Guest.new("Knut Erik", 1000, @song1)
  end

  def test_guest_has_name()
    assert_equal("Knut Erik", @guest1.name) # test 1
  end

  def test_guest_money_amount()
    assert_equal(1000, @guest1.money) # test 2
  end

  def test_guest_has_fav_song()
    assert_equal(@song1, @guest1.fav_song) # test 3
  end

  def test_guests_pays2_fee()
    @guest1.pay_fee(10)
    assert_equal(990, @guest1.money) # test 4
  end

  def test_guest_goes_woop_when_song_on_list_equals_true()
    woopy = @guest1.is_fav_song_present(true)
    assert_equal("Wooooop", woopy)
  end

end # end CLASS GUEST TEST
