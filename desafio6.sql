SELECT 
    CAST(MIN(pl.plan_value) AS DECIMAL (3, 2)) AS faturamento_minimo,
    CAST(MAX(pl.plan_value) AS DECIMAL (3, 2)) AS faturamento_maximo,
    CAST(AVG(plan_value) AS DECIMAL (3 , 2 )) AS faturamento_medio,
    SUM(pl.plan_value) AS faturamento_total
FROM SpotifyClone.plans AS pl
INNER JOIN SpotifyClone.users AS usr ON pl.plan_id = usr.plan_id;
