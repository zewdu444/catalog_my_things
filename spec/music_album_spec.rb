require_relative '../item'
require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(true)
  end

  # it 'takes three parameters and returns a Rental object' do
  #   expect(@book).to be_an_instance_of(Book)
  # end
end
