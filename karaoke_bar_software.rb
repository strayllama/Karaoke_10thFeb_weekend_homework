require_relative("room.rb")
require_relative("song.rb")
require_relative("guest.rb")

@rooms = []
@song_db = []

main_menu_choice = nil
anykey = "used for enter-anykey-to-continue input"
while main_menu_choice != "q" do
  print %x{clear}

  puts ""
  puts "WELCOME TO Karaoke Software Supreme!!"
  puts ""
  puts "\#\#\#\# MENU \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#"
  puts "1 -- Make room"
  puts "2 -- Add song"
  puts "3 -- Add guest"
  puts "4 -- See main song DB"
  puts "5 -- See room list"
  puts "q -- EXIT"
  puts "\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#"
  puts ""
  puts "Choice option from above: "
  main_menu_choice = gets.chomp
  print %x{clear}

  case main_menu_choice
  when "1"
    make_room_choice = nil
    while (make_room_choice != "b") do
      print %x{clear}
      puts "\#\#\#\# Make Room \#\#\#\#"
      puts "Type the capacity of NEW room: "
      puts "(type b to NOT make new room --> go back to main menu)"
      make_room_choice = gets.chomp
      if make_room_choice == "b"
      else
        room_capacity = make_room_choice
        puts "Type entry fee for new room: "
        room_entry_fee = gets.chomp
        new_room = Room.new(room_capacity, 0, room_entry_fee)
        print %x{clear}
        print %x{clear}
        puts "You have made a new ROOM, with the following:"
        puts "  ** Capacity: #{new_room.capacity()}"
        puts "  ** Guest Fee: #{new_room.room_fee()}"
        puts "  ** Till value: 0"
        puts "  ** Guests: 0"
        puts "  ** Songs: 0"
        puts ""
        puts "Please use other menu options to manage songs and guests."
        puts "TO CREATE IT!! enter Y, or to cancel just type anything else:"
        are_you_sure = gets.chomp.downcase
        @rooms << new_room if ( are_you_sure == "y" )
      end
    end


  when "2"
    add_song_choice = nil
    while (add_song_choice != "b") do
      print %x{clear}
      puts "\#\#\#\# ADD SONG \#\#\#\#"
      puts "Type the NEW song Aritst: "
      puts "(type b to NOT make a new song --> go back to main menu)"
      add_song_choice = gets.chomp
      if add_song_choice == "b"
      else
        new_song_artist = add_song_choice
        puts "Type the TITLE of the new song: "
        new_song_title = gets.chomp
        new_song = Song.new(new_song_title, new_song_artist)
        print %x{clear}
        puts "You have created a new SONG!!:"
        puts "  ** TITLE: #{new_song.title()}"
        puts "  ** ARTIST: #{new_song.artist()}"
        puts ""
        puts "This song will be added to the main song DB."
        puts "TO ADD IT!! enter Y, or to cancel just type anything else:"
        puts "(Press ENTER key to continue)"
        are_you_sure2 = gets.chomp.downcase
        @song_db << new_song if (are_you_sure2 == "y")
      end
    end  #end WHILE ADD SONG


  when "3"
    add_guest_choice = nil
    while (add_song_choice != "b") do
      print %x{clear}
      puts "\#\#\#\# ADD GUEST \#\#\#\#"
      puts "Type the name of the new guest:"
      puts "(type b to NOT add  a new song --> go back to main menu)"
      if add_song_choice == "b"
      else
        puts ""
        puts "Press ENTER key to return to main menu"
        anykey = gets.chomp
      end
    end

  when "4"
    print %x{clear}
    puts "\#\#\#\# Song DB \#\#\#\#"
    if @song_db.length > 0
      puts " Here are the current songs in the Main Song DB: "
      song_counter = 1
      for song in @song_db
        puts ""
        puts "SONG #{song_counter}"
        puts "  TITLE: #{song.title}"
        puts "  ARTIST: #{song.artist}"
      end # end FOR SONG IN SONGDB
    else
      puts " -- NO SONGS ADDED YET! --"
    end
    puts ""
    puts "Press ENTER key to return to main menu"
    anykey = gets.chomp


  when "5"
    print %x{clear}
    puts "\#\#\#\# Room List \#\#\#\#"
    if @rooms.length > 0
      puts " Here are the current rooms:"
      room_counter = 1
      for room in @rooms
        puts ""
        puts "ROOM #{room_counter}"
        puts "  Capacity: #{room.capacity()}"
        puts "  Guest Fee: #{room.room_fee()}"
        puts "  Current Till value: #{room.till()}"
        print "  Current Guests:"
        if room.occupants().length > 0
          guest_counter = 1
          for guest in room.occupants
            puts "  ** Guest #{room_counter} - guest[:name]"
          end
        else
          puts "    --empty room--"
        end # end IF
        room_counter += 1
      end # end FOR ROOM IN ROOMS
    else
      puts " -- NO ROOMS CREATED YET! --"
    end
    puts ""
    puts "Press ENTER key to return to main menu"
    anykey = gets.chomp

  when "q"
    puts "Thanks for using, see you next time!"

  else
    puts "That wasn't a valid option, try again."
    puts "(Press ENTER key to continue)"
    anykey = gets.chomp
  end # end CASE MAIN MENU CHOICE

end # end WHILE MAIN MENU CHOICE
