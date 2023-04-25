require_relative 'genre'
class Things
  attr_reader :music_albums, :genres
  def initialize
    @music_albums = []
    @genres = []
  end

  def add_music_album(music_album)
    @music_albums << music_album
  end

  def add_genre(genre)
    @genres << genre
  end
end
