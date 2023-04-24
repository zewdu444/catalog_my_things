require_relative './item'
class Movie < Item
  def initialize(silet)
    @silet = silet
  end

  private
  def can_be_archived?()
  end
end
