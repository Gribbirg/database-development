SELECT Coach.name AS CoachName
FROM Coach
         INNER JOIN Team ON Coach.team_id = Team.id
         INNER JOIN League ON Team.league_id = League.id
WHERE League.name = 'Serie A'
  AND NOT EXISTS (SELECT 1
                  FROM Team AS t
                           INNER JOIN League AS l ON t.league_id = l.id
                  WHERE l.name = 'Bundesliga'
                    AND t.id = Team.id);

SELECT Player.name AS PlayerName
FROM Player
         INNER JOIN Team ON Player.team_id = Team.id
         INNER JOIN League ON Team.league_id = League.id
WHERE League.name = 'Premier League'
  AND NOT EXISTS (SELECT 1
                  FROM Team AS t
                           INNER JOIN League AS l ON t.league_id = l.id
                  WHERE l.name = 'La Liga'
                    AND t.id = Team.id);

SELECT Equipment.name AS EquipmentName
FROM Equipment
         INNER JOIN GameEquipment ON Equipment.id = GameEquipment.equipment_id
WHERE GameEquipment.game_id = 1
  AND NOT EXISTS (SELECT 1
                  FROM GameEquipment AS ge
                  WHERE ge.equipment_id = Equipment.id
                    AND ge.game_id = 2);