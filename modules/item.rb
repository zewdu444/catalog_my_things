class Item
  attr_reader :id, :publish_date, :archived, :genere, :author, :label, :source
    def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    end
  def add_genere(genere)
    @genere = genere
    genere.items << self unless genere.items.include?(self)
  end
  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
  private def can_be_archived?
    if (Time.now.year - Date.parse(@published_date).year) > 10  #if date is in string format
      true
    else
      false
    end
  end
end
