class Label
  attr_reader :id, :title, :color, :items, :label

  def initialize(title, color, id=Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.label == self
  end
end
