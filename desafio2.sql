SELECT 
COUNT(DISTINCT sng.song_id) AS 'cancoes', 
COUNT(DISTINCT art.artist_name) AS 'artistas', 
COUNT(DISTINCT alb.album_id) AS 'albuns'
FROM SpotifyClone.songs AS sng
INNER JOIN 
SpotifyClone.artists AS art ON sng.artist_id = art.artist_id
INNER JOIN
SpotifyClone.albums AS alb ON art.artist_id = alb.artist_id;