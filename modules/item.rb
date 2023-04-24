class Item 
  def initialize(id, publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end

  private
  def can_be_archived?
    if (Time.now.year - @published_date.year) > 10
      true
    else
      false
  end
end
