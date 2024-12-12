SELECT venue_id,
       start_time,
       ROW_NUMBER() OVER (PARTITION BY venue_id ORDER BY start_time) AS game_rank
FROM Game;

SELECT team_id,
       name                                                 AS player_name,
       age,
       RANK() OVER (PARTITION BY team_id ORDER BY age DESC) AS age_rank
FROM Player;

SELECT country_id,
       name                                                               AS stadium_name,
       max_capacity,
       DENSE_RANK() OVER (PARTITION BY country_id ORDER BY max_capacity DESC) AS capacity_rank
FROM Stadium;

SELECT team_id,
       name                                              AS player_name,
       age,
       NTILE(4) OVER (PARTITION BY team_id ORDER BY age) AS age_group
FROM Player;
