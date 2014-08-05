require './lib/cd'
require 'pry'

def main_menu
  loop do
    puts "*** Main Menu ***"
    puts "Press 'a' to add a CD to your CD organizer"
    puts "Press 'l' to list your CDs"
    puts "Press 's' to search"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'a'
      add_cd_ui
    elsif main_choice == 'l'
      list_cd_ui
    elsif main_choice == 's'
      search_cd_ui
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def add_cd_ui
  puts "*** Add CD ***"
  puts "Enter the Artist name"
  user_artist = gets.chomp
  puts "Enter the Album name"
  user_album = gets.chomp
  new_cd = CD.new({:artist => user_artist, :album => user_album})
  new_cd.cd_add
  puts "'#{new_cd.album}' added!"
end

def list_cd_ui
  puts "*** CD List ***"
  puts  "Here are all of your CD's"
  CD.all.each do  |cd|
    puts "Artist: #{cd.artist} Album: #{cd.album}"
  end
end

def search_cd_ui
  puts "*** CD Search ***"
  puts "Search by Artist or Album"
  puts "Press 'a' to search by Artist"
  puts "Press 'l' to search by Album"
  puts "Press 'x' to return to the Main Menu"
  search_choice = gets.chomp
  if search_choice == 'a'
    artist_search_ui
  elsif search_choice == 'l'
    album_search_ui
  elsif search_choice == 'x'
    main_menu
  end
end

def artist_search_ui
  puts "Enter the Artist name you'd like to search for"
  search_artist = gets.chomp
  cd_search = CD.all.each do |cd|
    if search_artist == cd.artist
      puts "Artist: #{cd.artist} Album: #{cd.album}"
    end
  end
  if cd_search == []
    puts "No matches found"
  end
end

def album_search_ui
  puts "Enter the album name you'd like to search for"
  search_album = gets.chomp
  album_search = CD.all.each do  |cd|
    if search_album == cd.album
      puts "Artist: #{cd.artist} Album: #{cd.album}"
    end
  end
  if album_search == []
    puts "No matches found"
  end
end

main_menu
