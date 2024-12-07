SELECT
    team_id,
    COUNT(*) OVER(PARTITION BY team_id) AS player_count
FROM Player;

SELECT
    game_team_id,
    SUM(goals_scored) OVER(PARTITION BY game_team_id) AS total_goals
FROM Statistic;

SELECT
    team_id,
    AVG(age) OVER(PARTITION BY team_id) AS average_age
FROM Player;

SELECT
    country_id,
    MIN(capacity) OVER(PARTITION BY country_id) AS min_capacity
FROM Stadium;

SELECT
    team_id,
    MAX(experience_years) OVER(PARTITION BY team_id) AS max_experience
FROM Coach;
