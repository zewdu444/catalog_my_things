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
    count = 0
    puts 'Avaible music albums are:'
    @things.music_albums.each do |music_album|
      puts "#{count})This music album is in
      #{music_album.genre.name} genre and published
      at #{music_album.publish_date} and
      #{music_album.on_spotify ? 'available' : 'not available'} on Spotify."
      count += 1
    end
  end

  def create_music_album
    music_album = add_music_album
    genre = create_genre
    label = create_music_album_label
    source = create_source
    author = create_author
    music_album.genre = genre
    music_album.label = label
    music_album.source = source
    music_album.author = author
    @things.add_music_album(music_album)
    puts 'Music album added successfully!'
  end

  def list_genres
    puts 'Avaible genres are:'
    count = 0
    @things.genres.each do |genre|
      puts "#{count}) [Genre] name: #{genre}"
      count += 1
    end
  end

  def list_labels
    puts 'Avaible labels are:'
    count = 0
    @things.labels.each do |label|
      puts "#{count}) [Label] Tiltle:  #{label.title}, Color: #{label.color}"
      count += 1
    end
  end

  def list_sources
    puts 'Avaible sources are:'
    count = 0
    @things.sources.each do |source|
      puts "#{count}) [Source] Name:  #{source.name}"
      count += 1
    end
  end

  def list_authors
    puts 'Avaible Authors are:'
    count = 0
    @things.authors.each do |author|
      puts "#{count}) [Author] First name:  #{author.first_name}, Last name: #{author.last_name}"
      count += 1
    end
  end

  def add_music_album
    print 'Does music album avaible on the spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y'
    puts "Enter music album's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    MusicAlbum.new(on_spotify, published_date)
  end

  private

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @things.add_genre(genre)
    genre
  end

  def create_music_album_label
    print 'Enter label name: '
    label_name = gets.chomp
    label = Label.new(label_name, 'Unkown')
    @things.add_label(label)
    label
  end

  def create_source
    puts 'Enter the source (From a friend, Online, ...): '
    source_name = gets.chomp
    source = Source.new(source_name)
    @things.add_source(source)
    source
  end

  def create_author
    puts 'Enter the author fist name: '
    first_name = gets.chomp
    puts 'Enter the author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @things.add_author(author)
    author
  end
end
