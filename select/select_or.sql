SELECT Team.name AS TeamName, Stadium.name AS StadiumName
FROM Team
         INNER JOIN Stadium ON Team.home_venue_id = Stadium.id
         INNER JOIN League ON Team.league_id = League.id
WHERE League.name = 'Premier League'
   OR League.name = 'La Liga';

SELECT Game.start_time AS GameTime, Stadium.name AS StadiumName, Country.name AS CountryName
FROM Game
         INNER JOIN Stadium ON Game.venue_id = Stadium.id
         INNER JOIN Country ON Stadium.country_id = Country.id
WHERE Country.name = 'Brazil'
   OR Country.name = 'Germany';

(SELECT Player.name AS PlayerName, Coach.name AS CoachName, League.name AS LeagueName
 FROM Player
          INNER JOIN Team ON Player.team_id = Team.id
          INNER JOIN Coach ON Team.id = Coach.team_id
          INNER JOIN League ON Team.league_id = League.id
 WHERE League.name = 'Bundesliga')
UNION
(SELECT Player.name AS PlayerName, Coach.name AS CoachName, League.name AS LeagueName
 FROM Player
          INNER JOIN Team ON Player.team_id = Team.id
          INNER JOIN Coach ON Team.id = Coach.team_id
          INNER JOIN League ON Team.league_id = League.id
 WHERE League.name = 'Serie A');
