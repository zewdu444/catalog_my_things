require_relative './modules/author'
require_relative './modules/book'
require_relative './modules/game'
require_relative './modules/item'
require_relative './modules/label'
require_relative './modules/music_album'
require_relative './modules/source'
require_relative './modules/genre'

require 'date'

class App
  def initialize(things)
    @things = things
  end

  def list_music_albums
    count = 0
    puts 'Avaible music albums are:'
    @things.music_albums.each do |music_album|
      puts "#{count})This music album is in " \
           "#{music_album.genre.name} genre, and published " \
           "at #{music_album.publish_date} which is " \
           "#{music_album.on_spotify ? 'available' : 'not available'} on the Spotify."
      count += 1
    end
  end
  
  def create_music_album
    music_album = add_music_album
    genre = create_genre
    label = create_music_album_label
    source = create_source
    author = create_author
    music_album.add_genre(genre)
    music_album.add_source(source)
    music_album.add_author(author)
    music_album.add_label(label)
    @things.add_music_album(music_album)
    puts 'Music album added successfully!'
  end
  
    def create_book
    puts 'to create book please enter the following information:'
    print "Enter book's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    print "Enter book's publisher: "
    publisher = gets.chomp
    print "Enter book's cover state: "
    cover_state = gets.chomp
    book = Book.new(published_date, publisher, cover_state)
    book.add_author(create_author)
    book.add_label(create_label)
    book.add_source(create_source)
    book.add_genre(create_genre)
    @things.add_book(book)
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Avaible books are:'
    @counter = 1
    @things.books.each do |book|
      puts "#{@counter}) This book is in #{book.genre.name} genre, by #{book.author.first_name} #{book.author.last_name}. published at #{book.publish_date} and has #{book.cover_state} cover state."
      @counter += 1
    end
  end

  def create_game
    puts 'to create game please enter the following information:'
    print "Enter game's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    print 'Enter game multiplayer mode:[true/false] '
    multiplayer = gets.chomp.to_s
    multiplayer = multiplayer == 'true'
    print "Enter game's last played date(format: YYYY/MM/DD): "
    last_played_at = Date.parse(gets.chomp)
    game = Game.new(published_date, multiplayer, last_played_at)
    game.add_author(create_author)
    game.add_label(create_label)
    game.add_source(create_source)
    game.add_genre(create_genre)
    @things.add_game(game)
    puts 'Game added successfully!'
  end

  def list_games
    @counter = 1
    puts 'Avaible games are:'
    @things.games.each do |game|
      puts "#{@counter}) This game is in #{game.genre.name} genre and published at #{game.publish_date} and multiplayer mode  #{game.multiplayer} ."
      @counter += 1
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
 
  def list_genres
    @counter = 1
    puts 'Avaible genres are:'
    @things.genres.each do |genre|
      puts "#{@counter}) [Genre] name: #{genre.name}"
      @counter += 1
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

  private

  def add_music_album
    print 'Does music album avaible on the spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y'
    puts "Enter music album's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    MusicAlbum.new(on_spotify, published_date)
  end
  
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
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @things.add_author(author)
    author
  end

  def create_label
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @things.add_label(label)
    label
  end
end
