SELECT T.name AS TeamName
FROM Team T
WHERE NOT EXISTS (SELECT G.id
                  FROM Game G
                  WHERE G.venue_id IN (SELECT T.home_venue_id
                                       FROM League L
                                       WHERE L.id = T.league_id)
                    AND NOT EXISTS (SELECT *
                                    FROM GameTeam GT
                                    WHERE GT.game_id = G.id
                                      AND GT.team_id = T.id));