SELECT *
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId
JOIN Artist ON Artist.ArtistId = Song.ArtistId
JOIN Genre ON Genre.GenreId = Song.GenreId
;