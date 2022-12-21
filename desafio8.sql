SELECT art.artist_name AS artista,
alb.album_name AS album 
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb
WHERE art.artist_name = 'Elis Regina' AND art.artist_id = alb.artist_id;