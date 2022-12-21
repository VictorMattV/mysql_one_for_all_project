SELECT 
usr.user_name AS usuario, 
COUNT(DISTINCT sng.song_name) AS qt_de_musicas_ouvidas, 
ROUND(SUM(sng.song_duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS usr
INNER JOIN SpotifyClone.reproduction_history AS rep ON usr.user_id = rep.user_id
INNER JOIN SpotifyClone.songs AS sng ON rep.song_id = sng.song_id
GROUP BY usr.user_id
ORDER BY 1 ASC;