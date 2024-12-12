SELECT Player.id,
       Player.name,
       Player.age,
       Coach.experience_years
FROM Player
         NATURAL JOIN Coach;


SELECT Coach.name AS coach_name,
       Team.name  AS team_name
FROM Coach
         INNER JOIN Team ON Coach.team_id = Team.id;

SELECT Player.name AS player_name,
       Team.name   AS team_name
FROM Player
         LEFT JOIN Team ON Player.team_id = Team.id;

SELECT Coach.name AS coach_name,
       Team.name  AS team_name
FROM Coach
         RIGHT JOIN Team ON Coach.team_id = Team.id;
