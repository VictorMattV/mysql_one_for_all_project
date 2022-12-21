SELECT usr.user_name AS usuario,
CASE
	WHEN MAX(YEAR(reproduction_date)) >= 2021 THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
    END status_usuario
FROM SpotifyClone.users AS usr
INNER JOIN SpotifyClone.reproduction_history AS rep 
ON usr.user_id = rep.user_id
GROUP BY usr.user_name
ORDER BY usuario;