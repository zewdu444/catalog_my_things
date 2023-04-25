require_relative 'genre'
class Things
  attr_reader :music_albums, :genres
  def initialize
    @music_albums = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def add_music_album(music_album)
    @music_albums << music_album
  end

  def add_genre(genre)
    @genres << genre.name unless @genres.include?(genre.name)
  end

  def add_label(label)
    @labels << label unless @labels.include?(label)
  end

  def add_author(author)
    @authors << author unless @authors.include?(author)
  end

  def add_source(source)
    @sources << source unless @sources.include?(source)
  end
end
