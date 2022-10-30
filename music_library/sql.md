SELECT albums.id AS id,
       albums.title
  FROM artists
    JOIN albums
    ON albums.artist_id = artists.id
	WHERE artists.name = 'Taylor Swift';
=>
id |  title   
----+----------
  6 | Lover
  7 | Folklore

  SELECT albums.id AS id,
       albums.title
  FROM artists
    JOIN albums
    ON albums.artist_id = artists.id
	WHERE albums.release_year = '1988' and artists.name = 'Pixies';

  =>
   id |    title    
----+-------------
  2 | Surfer Rosa

  SELECT albums.id AS id,
       albums.title
  FROM artists
    JOIN albums
    ON albums.artist_id = artists.id
	WHERE albums.release_year > '1975' and artists.name = 'Nina Simone';
  =>
  
  9	Baltimore
  11	Fodder on My Wings