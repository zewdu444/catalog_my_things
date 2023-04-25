require_relative 'spec_helper'
require_relative '../modules/label'
require_relative '../modules/item'
require_relative '../modules/book'

describe Book do
  before :each do
    @book = Book.new('20020-01-01', 'Amazon', 'good')
  end
  it 'takes two parameters and return a book object' do
    expect(@book).to be_an_instance_of(Book)
  end
  it 'should be return true if the book is damaged' do
    @book = Book.new('20011-01-01', 'Amazon', 'bad')
    @book.move_to_archive
    expect(@book.send(:can_be_archived?)).to be true
  end
  it 'should be return true if the book is older than 10 years' do
    @book = Book.new('2002-01-01', 'Amazon', 'good')
    @book.move_to_archive
    expect(@book.send(:can_be_archived?)).to be true
  end
end
