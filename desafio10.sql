SELECT sng.song_name AS nome,
COUNT(rep.user_id) AS reproducoes  
FROM SpotifyClone.songs AS sng
INNER JOIN SpotifyClone.reproduction_history AS rep 
ON sng.song_id = rep.song_id
INNER JOIN SpotifyClone.users AS usr 
ON usr.user_id = rep.user_id
WHERE usr.plan_id = 1 OR usr.plan_id = 4
GROUP BY sng.song_name
ORDER BY nome, reproducoes;