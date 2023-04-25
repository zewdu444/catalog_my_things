require_relative 'spec_helper'
require_relative '../modules/author'
require_relative '../modules/item'

describe Author do
  before :each do
    @author = Author.new('zewdu', 'erkyhun')
  end
  it 'takes two parameters and return a author object' do
    expect(@author).to be_an_instance_of(Author)
  end
  it 'should be return true if the author has an item' do
    @item = Item.new('2002-01-01')
    @item.add_author(@author)
    expect(@author.items).to include(@item)
  end
end
