SELECT sng.song_name AS 'cancao', COUNT(rep.user_id) AS 'reproducoes' 
FROM SpotifyClone.songs AS sng
INNER JOIN SpotifyClone.reproduction_history AS rep ON sng.song_id = rep.song_id
GROUP BY sng.song_name
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;