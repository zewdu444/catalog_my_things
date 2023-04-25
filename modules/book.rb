require_relative 'item'
class Book < Item
  def initialize(publisher, cover_state, publish_date = 'Uknown')
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?; end
end
