require_relative 'author'
require_relative 'book'
require_relative 'game'
require_relative 'item'
require_relative 'label'
require_relative 'movie'
require_relative 'music_album'
require_relative 'source'

class App
  def initialize(things)
    @things = things
  end

def list_music_albums
  puts 'Avaible music albums are:'
  @things.music_albums.each do |music_album|
    puts music_album
  end
end

def create_music_album
end

def create_genre(genre_name)
  genre = Genre.new(genre_name)
  @things.add_genre(genre)
end

def list_genres
  puts 'Avaible genres are:'
  @things.genres.each do |genre|
    puts genre
  end
end
end
