require_relative 'item'
class Game < Item
  def initialize(multiplayer, last_played_at, publish_date = 'Uknown')
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?; end
end
