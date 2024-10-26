SELECT Coach.name AS CoachName
FROM Coach
         INNER JOIN Team ON Coach.team_id = Team.id
WHERE EXISTS (SELECT 1
              FROM League
              WHERE League.id = Team.league_id
                AND (League.name = 'Bundesliga' OR League.name = 'Serie A'));

SELECT Coach.name AS CoachName
FROM Coach
         INNER JOIN Team ON Coach.team_id = Team.id
WHERE EXISTS (SELECT 1
              FROM League
              WHERE League.id = Team.league_id
                AND League.name = 'Bundesliga')
   OR EXISTS (SELECT 1
              FROM League
              WHERE League.id = Team.league_id
                AND League.name = 'Serie A');

SELECT *
FROM Game
         INNER JOIN GameEquipment ON Game.id = GameEquipment.game_id
WHERE GameEquipment.equipment_id = 1
  AND EXISTS (SELECT 1
              FROM GameEquipment AS ge1
              WHERE ge1.game_id = Game.id
                AND ge1.equipment_id = 2);