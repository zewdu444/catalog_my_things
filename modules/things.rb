require 'json_read_write'
class Things
  include JsonReadWrite
  attr_reader :music_albums, :genres, :books, :labels, :authors, :games, :sources

  def initialize
    @music_albums = [] || json_read('../localstorage/music_album.json')
    @books = [] || json_read('../localstorage/book.json')
    @labels = [] || json_read('../localstorage/label.json')
    @genres = [] || json_read('../localstorage/genre.json')
    @authors = [] || json_read('../localstorage/author.json')
    @games = [] || json_read('../localstorage/game.json')
    @sources = [] || json_read('../localstorage/source.json')
  end

  def add_music_album(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
    json_music_album =
      {
        on_spotify: music_album.on_spotify,
        genre: music_album.genre.name,
        publish_date: music_album.publish_date,
        id: music_album.id,
        label_title: music_album.label.title,
        author_first_name: music_album.author.first_name,
        author_last_name: music_album.author.last_name,
        source: music_album.source.name
      }
    json_write('../localstorage/music_album.json', json_music_album)
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
