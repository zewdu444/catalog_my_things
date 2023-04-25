require_relative './modules/author'
require_relative './modules/book'
require_relative './modules/game'
require_relative './modules/item'
require_relative './modules/label'
require_relative './modules/music_album'
require_relative './modules/source'

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

def create_music_album(on_spotify, published_date)
  music_album = MusicAlbum.new(on_spotify, published_date)
  @things.add_music_album(music_album)
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
