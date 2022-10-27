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

  it 'add 1 new album, should return last added album' do
    repository = AlbumRepository.new
    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1
    repository.create(album)
    all_albums = repository.all
    expect(all_albums.size).to eq(13)
  end

  it 'update album, should return new title' do
    repository = AlbumRepository.new
    album = repository.find(1)
    album.title = 'No-Doolittle'
    album.release_year = 1991
    repository.update(album)

    new_album = repository.find(1)
    expect(new_album.title).to eq('No-Doolittle')
  end


  it 'delete album, should return 11 albums' do
    repository = AlbumRepository.new
    repository.delete(1)
    all_albums = repository.all
    expect(all_albums.size).to eq(11)
  end
end
