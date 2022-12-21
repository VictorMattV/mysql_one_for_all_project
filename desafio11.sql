SELECT song_name AS nome_musica,
CASE WHEN song_name like '%Bard%' THEN REPLACE(song_name, 'Bard', 'QA') 
WHEN song_name like '%Amar%' THEN REPLACE(song_name, 'Amar', 'Code Review')
WHEN song_name like '%Pais%' THEN REPLACE(song_name, 'Pais', 'Pull Requests')
WHEN song_name like '%SOUL%' THEN REPLACE(song_name, 'SOUL', 'CODE')
WHEN song_name like '%SUPERSTAR%' THEN REPLACE(song_name, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.songs
HAVING novo_nome IS NOT NULL
ORDER BY novo_nome DESC;