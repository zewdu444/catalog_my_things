require_relative 'spec_helper'
require_relative '../modules/label'
require_relative '../modules/item'

describe Label do
  before :each do
    @label = Label.new('label1', 'red')
  end
  it 'takes two parameters and return a label object' do
    expect(@label).to be_an_instance_of(Label)
  end
  it 'should be return true if the label has an item' do
    @item = Item.new('2002-01-01')
    @item.add_label(@label)
    expect(@label.items).to include(@item)
  end
end
