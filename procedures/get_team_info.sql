DELIMITER //

CREATE PROCEDURE GetTeamInfo(
    IN p_team_id INTEGER,
    IN p_game_id INTEGER
)
BEGIN
    SELECT t.id   AS team_id,
           t.name AS team_name,
           p.id   AS player_id,
           p.name AS player_name,
           s.goals_scored,
           s.auto_goals_scored,
           s.fouls
    FROM Team t
             LEFT JOIN Player p ON t.id = p.team_id
             LEFT JOIN Statistic s ON p.id = s.player_id AND s.game_team_id = (SELECT gt.id
                                                                               FROM GameTeam gt
                                                                               WHERE gt.team_id = t.id
                                                                                 AND gt.game_id = p_game_id)
    WHERE t.id = p_team_id;
END //

DELIMITER ;

CALL GetTeamInfo(2, 3);
