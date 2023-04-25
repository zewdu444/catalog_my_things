require_relative 'spec_helper'
require_relative '../modules/game'
require_relative '../modules/item'

describe Game do
  before :each do
    @game = Game.new('2002-01-01', 'PC', '2020-12-12')
  end
  it 'takes three parameters and return a game object' do
    expect(@game).to be_an_instance_of(Game)
  end
  it 'should be return true if the game is older than 15 years' do
    @game = Game.new('2002-01-01', 'PC', '2020-12-12')
    @game.move_to_archive
    expect(@game.send(:can_be_archived?)).to be true
  end
  it 'should be return true if the game is damaged' do
    @game = Game.new('2002-01-01', 'PC', '2020-12-12')
    @game.move_to_archive
    expect(@game.send(:can_be_archived?)).to be true
  end
end
