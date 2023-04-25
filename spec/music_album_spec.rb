require_relative '../modules/item'
require_relative '../modules/music_album'
require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(true)
  end

  it '@muisic_album should be an instance of MusicAlbum class' do
    expect(@music_album).to be_an_instance_of(MusicAlbum)
  end

end
