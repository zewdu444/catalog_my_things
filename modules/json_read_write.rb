require 'json'
require_relative 'things'

module JsonReadWrite
  def json_write(file_name, json_data)
    existing_data = []
    existing_data = JSON.parse(File.read(file_name)) if File.exist?(file_name) && !File.empty?(file_name)
    existing_data << json_data
    File.write(file_name, JSON.pretty_generate(existing_data))
  end

  def json_read(file_name)
    case file_name
    when './localstorage/book.json'
      read_books(file_name)
    when './localstorage/genre.json'
      read_genres(file_name)
    when './localstorage/music_album.json'
      read_music_albums(file_name)
    when './localstorage/movie.json'
      read_movies(file_name)
    when './localstorage/source.json'
      read_sources(file_name)
    when './localstorage/game.json'
      read_games(file_name)
    when './localstorage/label.json'
      read_labels(file_name)
    when './localstorage/author.json'
      read_authors(file_name)
    else
      []
    end
  end

  private

  def read_music_albums(file_name)
    music_albums = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |music_album|
        album = MusicAlbum.new(music_album['on_spotify'], music_album['publish_date'])
        album.add_genre(Genre.new(music_album['name']))
        album.add_source(Source.new(music_album['source']))
        album.add_author(Author.new(music_album['first_name'], music_album['last_name']))
        album.add_label(Label.new(music_album['title'], music_album['color']))
        music_albums << album
      end
    end
    music_albums
  end

  def read_genres(file_name)
    genres = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |genre|
        genres << Genre.new(genre['name'], genre['id'])
      end
    end
    genres
  end

  def read_books(file_name)
    books = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |book|
        read_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
        read_book.add_genre(Genre.new(book['name']))
        read_book.add_source(Source.new(book['source']))
        read_book.add_author(Author.new(book['first_name'], book['last_name']))
        read_book.add_label(Label.new(book['title'], book['color']))
        books << read_book
      end
    end
    books
  end

  def read_authors(file_name)
    authors = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |author|
        authors << Author.new(author['first_name'], author['last_name'], author['id'])
      end
    end
    authors
  end

  def read_sources(file_name)
    sources = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |source|
        sources << Source.new(source['name'], source['id'])
      end
    end
    sources
  end

  def read_games(file_name)
    games = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |game|
        read_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
        read_game.add_genre(Genre.new(game['name']))
        read_game.add_source(Source.new(game['source']))
        read_game.add_author(Author.new(game['first_name'], game['last_name']))
        read_game.add_label(Label.new(game['title'], game['color']))
        games << read_game
      end
    end
    games
  end

  def read_labels(file_name)
    labels = []
    file_contents = File.read(file_name)
    unless file_contents.empty?
      temp = JSON.parse(file_contents)
      temp.each do |label|
        labels << Label.new(label['title'], label['color'], label['id'])
      end
    end
    labels
  end
end
