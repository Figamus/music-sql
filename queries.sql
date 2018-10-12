/*
SELECT *
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId
JOIN Artist ON Artist.ArtistId = Song.ArtistId
JOIN Genre ON Genre.GenreId = Song.GenreId
;
*/

/*
INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("50 Cent", 1996)
;
*/
/*
--SELECT * FROM Artist;

--DELETE FROM Artist WHERE ArtistId = 28;
*/
/*
UPDATE Artist
SET ArtistName = "50cent"
WHERE ArtistId = 29
;

;
SELECT *
FROM Album a
LEFT JOIN Song s ON s.AlbumId = a.AlbumId
;

SELECT * FROM Genre

;

--Which Genre has the most albums assigned to it?
Select g."Label", COUNT(al."AlbumId") As AlbumCount
From "Genre" g
Join "Album" al On al."GenreId" = g."GenreId"
Group By g."Label"
Order By AlbumCount Desc
Limit 1
*/
;
--1. Query all of the entries in the Genre table
SELECT *
FROM Genre
;
SELECT *
FROM Artist
;
SELECT *
FROM Album
;
SELECT *
FROM Song
;
--2. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Disturbed", 1997)
;

--3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album
(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES
("Disturbed", 1997, 4718, "Warner Bros.", 31, 5)
;
--4. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song
(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES
("The Sickness", 433, "4/12/2000" , 5, 31, 23)
;
--5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT Song.Title, Album.Title, Artist.ArtistName
FROM Song
LEFT JOIN Artist ON Song.ArtistId = Artist.ArtistId
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId
WHERE Artist.ArtistId = 31
;
--6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select Album.Title, COUNT(Song.SongId) As SongCount
From Album
JOIN Song ON Song.AlbumId = Album.AlbumId
Group By Album.Title
Order By SongCount Desc
;
--7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select Artist.ArtistName, COUNT(Song.SongId) As SongCount
From Artist
JOIN Song ON Song.ArtistId = Artist.ArtistId
Group By Artist.ArtistName
Order By SongCount Desc
;
--8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select Genre.Label, COUNT(Song.SongId) As SongCount
From Genre
Join Song On Song.GenreId = Genre.GenreId
Group By Genre.Label
Order By SongCount Desc
;
--9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Album.Title, MAX(Album.AlbumLength)
FROM Album
;
--10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration
SELECT Song.Title, MAX(Song.SongLength)
FROM Song
;
--11. Modify the previous query to also display the title of the album.
SELECT Song.Title, Album.Title, MAX(Song.SongLength)
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId
;