# file: app.rb
require_relative 'lib/album_repository'
require_relative 'lib/database_connection'
require_relative 'lib/album'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library_test')

# Perform a SQL query on the database and get the result set.
albums = AlbumRepository.new
album =  albums.find('3')
puts "#{album.id} - #{album.title} - #{album.release_year} - #{album.artist_id}"