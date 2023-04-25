class Source
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source == self
  end
end
