class Item 
  def initialize(id, publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive()
  end

  private
  def can_be_archived?()
  end
end
