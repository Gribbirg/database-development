SELECT Coach.name AS CoachName, COUNT(Player.id) AS TotalPlayers
FROM Coach
         INNER JOIN Team ON Coach.team_id = Team.id
         INNER JOIN Player ON Team.id = Player.team_id
GROUP BY Coach.name
ORDER BY TotalPlayers DESC;

SELECT Team.name AS TeamName, SUM(Statistic.goals_scored) AS TotalGoals
FROM Team
         INNER JOIN Player ON Team.id = Player.team_id
         INNER JOIN Statistic ON Player.id = Statistic.player_id
GROUP BY Team.name
ORDER BY TotalGoals DESC;

SELECT Game.id AS GameID, Stadium.name AS StadiumName, Game.start_time
FROM Game
         INNER JOIN Stadium ON Game.venue_id = Stadium.id
ORDER BY Game.start_time DESC;