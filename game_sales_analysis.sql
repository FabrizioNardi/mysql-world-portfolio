--  Pré-visualização da base de dados
SELECT 
    pos,
    game,
    platform,
    publisher,
    genre,
    week,
    weekly,
    total,
    week_ending,
    id
FROM tutorial.global_weekly_charts_2013_2014
LIMIT 100;


--  Plataforma com mais vendas semanais totais
SELECT platform, SUM(weekly) AS total_weekly_sales
FROM tutorial.global_weekly_charts_2013_2014
GROUP BY platform
ORDER BY total_weekly_sales DESC;


--  Jogo com mais vendas semanais totais
SELECT game, SUM(weekly) AS total_weekly_sales
FROM tutorial.global_weekly_charts_2013_2014
GROUP BY game
ORDER BY total_weekly_sales DESC;


--  Total de jogos por plataforma
SELECT platform, COUNT(DISTINCT game) AS total_games
FROM tutorial.global_weekly_charts_2013_2014
GROUP BY platform
ORDER BY total_games DESC;


--  Gêneros mais frequentes no PS3
SELECT platform, COUNT(game) AS total_games, genre
FROM tutorial.global_weekly_charts_2013_2014
WHERE platform = 'PS3'
GROUP BY platform, genre
ORDER BY total_games DESC;


--  Jogos que começam com 'Pokemon', ordenados pelas vendas semanais
SELECT game, weekly AS weekly_sales
FROM tutorial.global_weekly_charts_2013_2014
WHERE game LIKE 'Pokemon%'
ORDER BY weekly_sales DESC;


--  Total de jogos de RPG por plataforma
SELECT platform, COUNT(genre) AS total_role_playing_games
FROM tutorial.global_weekly_charts_2013_2014
WHERE genre = 'Role-Playing'
GROUP BY platform
ORDER BY total_role_playing_games DESC;


--  Top 10 publishers com maior número de jogos
SELECT publisher, COUNT(DISTINCT game) AS total_games
FROM tutorial.global_weekly_charts_2013_2014
GROUP BY publisher
ORDER BY total_games DESC
LIMIT 10;


--  Vendas semanais de GTA V por plataforma (PS3 e X360)
SELECT platform, SUM(weekly) AS gta_sales
FROM tutorial.global_weekly_charts_2013_2014
WHERE game = 'Grand Theft Auto V'
  AND platform IN ('PS3', 'X360')
GROUP BY platform;


--  Semana com maior volume de vendas globais
SELECT week, SUM(weekly) AS total_weekly_sales
FROM tutorial.global_weekly_charts_2013_2014
GROUP BY week
ORDER BY total_weekly_sales DESC
LIMIT 1;


--  Jogos de publishers com até 2 jogos publicados
WITH one_game_publishers AS (
    SELECT publisher
    FROM tutorial.global_weekly_charts_2013_2014
    GROUP BY publisher
    HAVING COUNT(DISTINCT game) < 3
)

SELECT game, publisher, SUM(weekly) AS total_weekly_sales
FROM tutorial.global_weekly_charts_2013_2014
WHERE publisher IN (SELECT publisher FROM one_game_publishers)
GROUP BY game, publisher
ORDER BY total_weekly_sales DESC
LIMIT 15;
