SELECT Team.name AS TeamName, COUNT(Player.id) AS TotalPlayers
FROM Team
         LEFT JOIN Player ON Team.id = Player.team_id
GROUP BY Team.name;

SELECT Stadium.name AS StadiumName, COUNT(Game.id) AS TotalGames
FROM Stadium
         LEFT JOIN Game ON Stadium.id = Game.venue_id
GROUP BY Stadium.name;

SELECT Team.name AS TeamName, SUM(Statistic.goals_scored) AS TotalGoals
FROM Team
         INNER JOIN Player ON Team.id = Player.team_id
         INNER JOIN Statistic ON Player.id = Statistic.player_id
GROUP BY Team.name;