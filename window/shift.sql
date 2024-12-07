SELECT
    team_id,
    name AS coach_name,
    experience_years,
    LAG(name) OVER(PARTITION BY team_id ORDER BY experience_years DESC) AS previous_coach
FROM Coach;

SELECT
    team_id,
    name AS player_name,
    age,
    LEAD(name) OVER(PARTITION BY team_id ORDER BY age) AS next_player
FROM Player;

SELECT
    venue_id,
    start_time,
    FIRST_VALUE(start_time) OVER(PARTITION BY venue_id ORDER BY start_time) AS first_game
FROM Game;

SELECT
    venue_id,
    start_time,
    LAST_VALUE(start_time) OVER(PARTITION BY venue_id ORDER BY start_time ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_game
FROM Game;
