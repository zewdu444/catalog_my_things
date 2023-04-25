require_relative './modules/author'
require_relative './modules/book'
require_relative './modules/game'
require_relative './modules/item'
require_relative './modules/label'
require_relative './modules/music_album'
require_relative './modules/source'
require 'date'
class App
  def initialize(things)
    @things = things
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
      puts "#{@counter}) This book is in #{book.genre.name} genre and published at #{book.publish_date} and  #{book.cover_state} cover state."
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

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @things.add_genre(genre)
    genre
  end

  def list_genres
    @counter = 1
    puts 'Avaible genres are:'
    @things.genres.each do |genre|
      puts "#{@counter}) Genre name: #{genre.name}"
      @counter += 1
    end
  end

  def list_sources
    @counter = 1
    puts 'Avaible sources are:'
    @things.sources.each do |source|
      puts "#{@counter}) Source name: #{source.name}"
      @counter += 1
    end
  end

  def create_source
    print 'Enter source: '
    source_name = gets.chomp
    source = Source.new(source_name)
    @things.add_source(source)
    source
  end

  def list_authors
    @counter = 1
    puts 'Avaible authors are:'
    @things.authors.each do |author|
      puts "#{@counter}) Author name: #{author.first_name} #{author.last_name}"
      @counter += 1
    end
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

  def list_labels
    @counter = 1
    puts 'Avaible labels are:'
    @things.labels.each do |label|
      puts "#{@counter}) title: #{label.title} and color: #{label.color}"
      @counter += 1
    end
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
