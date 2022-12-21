SELECT Distinct
art.artist_name AS 'artista', 
alb.album_name AS 'album',
COUNT(fol.user_id) AS 'seguidores'
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb 
ON art.artist_id = alb.artist_id
INNER JOIN SpotifyClone.follow_list AS fol 
ON art.artist_id = fol.artist_id
GROUP BY art.artist_id, alb.album_id
ORDER BY seguidores DESC, artista ASC, album ASC;