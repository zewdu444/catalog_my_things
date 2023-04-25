require_relative 'genre'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'source'
require_relative 'game'
require_relative 'author'
class Things
  attr_reader :music_albums, :genres, :books, :labels, :authors, :games, :sources

  def initialize
    @music_albums = []
    @books = []
    @labels = []
    @genres = []
    @authors = []
    @games = []
    @sources = []
  end

  def add_music_album(music_album)
    @music_albums << music_album
  end

  def add_genre(genre)
    @genres << genre
  end

  def add_book(book)
    @books << book
  end

  def add_label(label)
    @labels << label
  end

  def add_author(author)
    @authors << author
  end

  def add_game(game)
    @games << game
  end

  def add_source(source)
    @sources << source
  end
end
