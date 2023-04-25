require_relative 'app'
require_relative './modules/things'
require_relative './menu'

def main
  things = Things.new
  app = App.new(things)
  menu = Menu.new(app)
  menu.show
end
puts 'Hello here! welcome to Catalog of my things App!'
puts ''

main
