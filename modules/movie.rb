require_relative 'item'
class Movie < Item
  def initialize(silet, publish_date = 'Uknown')
    super(publish_date)
    @silet = silet
  end

  private

  def can_be_archived?; end
end
