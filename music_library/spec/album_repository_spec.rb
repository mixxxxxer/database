require 'album_repository'
require 'pg'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_albums_table
  end


  it 'return 12 albums' do
    repo = AlbumRepository.new
    albums = repo.all
    albums.length # =>  12
    expect(albums[0].id).to eq '1'
    expect(albums[0].title).to eq 'Doolittle' # =>  'Doolitle'
    expect(albums[0].release_year).to eq '1989'
    expect(albums[0].artist_id).to eq '1'
  end

  it 'return album with id 1' do
    repo = AlbumRepository.new

    album = repo.find(1)

    expect(album.id).to eq('1') # =>  1
    expect(album.title).to eq('Doolittle')
    expect(album.release_year).to eq('1989')
    expect(album.artist_id).to eq('1')
  end
end
