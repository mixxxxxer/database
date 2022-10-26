require 'album'

class AlbumRepository
  def all
    albums = []
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end
    albums
  end

  def find(id)
    album = Album.new
    sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = 1;'
    result_set = DatabaseConnection.exec_params(sql, [] )
    album.id = result_set.first['id']
    album.title = result_set.first['title']
    album.release_year = result_set.first['release_year']
    album.artist_id = result_set.first['artist_id']
    return album
  end

  def create(album)
    # Executes the SQL query:
    # INSERT INTO albums (title, release_year, artist_id)
    #   VALUES ('Home', '2013', '6');
  end

  def update(album)
    # Executes the SQL query:
    # UPDATE albums SET title = new_title WHERE id = 2;
  end

  def delete(album)
    # Executes the SQL query:
    # DELETE FROM albums WHERE id = 2;
  end
end