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
    temp = JSON.parse(File.read(file_name))
    temp.each do |music_album|
      album = MusicAlbum.new(music_album['on_spotify'], music_album['publish_date'])
      album.add_genre(Genre.new(music_album['name']))
      album.add_source(Source.new(music_album['title']))
      album.add_author(Author.new(music_album['first_name'], music_album['last_name']))
      album.add_label(Label.new(music_album['source'], 'Uknown'))
      music_albums << album
      p album
    end
    music_albums
  end

  def read_books(file_name); end

  def read_authors(file_name); end

  def read_sources(file_name); end

  def read_games(file_name); end

  def read_genres(file_name); end

  def read_movies(file_name); end

  def read_labels(file_name); end
end
