require_relative './item'
class MusicAlbum < Item
  def initialize(on_spotify)
    @on_spotify = on_spotify
  end

  private
  def can_be_archived?()
  end
end
