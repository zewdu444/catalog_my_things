require_relative 'item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :label, :source, :author

  def initialize(on_spotify, publish_date = 'Uknown')
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
