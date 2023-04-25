require 'date'
class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    if Time.now.year - Date.parse(@last_played_at).year > 2 && super
      true
    else
      false
    end
  end
end
