class Room
attr_reader(:capacity, :till, :room_fee, :song_list, :occupants)

  def initialize(capacity, till, room_fee, song_list = [], occupants = [])
    @capacity = capacity
    @song_list = song_list
    @till = till
    @room_fee = room_fee
    @occupants = occupants
  end

  def add_guest(guest)
    if @occupants.length < @capacity
      @occupants << guest
    else
      return false
    end
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def collect_guest_fee(guest)
    guest.pay_fee(@room_fee)
    @till += @room_fee
  end

  def add_song(song)
    @song_list << song
  end


  def song_list()
    if @song_list.length > 0
      @song_list.each_with_index { | song, index | puts "  #{index + 1} -- #{song.title()}"}
    else
      print " -- NO SONGS ADDED YET! --"
    end
  end
end # end CLASS ROOM
