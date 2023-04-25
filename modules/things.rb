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
    @music_albums << music_album unless @music_albums.include?(music_album)
  end

  def add_genre(genre)
    @genres << genre unless @genres.include?(genre)
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

  def add_book(book)
    @books << book unless @books.include?(book)
  end

  def add_game(game)
    @games << game unless @games.include?(game)
  end
end
