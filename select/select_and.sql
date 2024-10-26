SELECT *
FROM player,
     team
WHERE team.name LIKE 'Ajax'
  AND player.age in (25, 28);

SELECT *
FROM player
         INNER JOIN team ON player.team_id = team.id
WHERE team.name LIKE 'Club %'
  AND player.age = 19;

SELECT *
FROM equipment
         INNER JOIN equipmenttype ON equipment.type_id = equipmenttype.id
WHERE equipmenttype.name LIKE 'Ball'
  AND equipment.games_count > 4;