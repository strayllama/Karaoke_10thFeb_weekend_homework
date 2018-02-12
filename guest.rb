class Guest
attr_reader(:name, :fav_song, :money)
#attr_accessor()

  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end

  def pay_fee(fee)
    @money -= fee
  end

  def is_fav_song_present(present)
    return "Wooooop" if present
  end

end # end CLASS GUEST
