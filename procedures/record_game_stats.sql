DELIMITER //

CREATE PROCEDURE RecordGameStats(
    IN p_player_id INTEGER,
    IN p_game_team_id INTEGER,
    IN p_position_id INTEGER,
    IN p_goals_scored INTEGER,
    IN p_auto_goals_scored INTEGER,
    IN p_fouls INTEGER
)
BEGIN
    DECLARE v_stat_id INTEGER;

    SELECT id
    INTO v_stat_id
    FROM Statistic
    WHERE player_id = p_player_id
      AND game_team_id = p_game_team_id;

    IF v_stat_id IS NULL THEN
        INSERT INTO Statistic (player_id, game_team_id, position_id, goals_scored, auto_goals_scored, fouls)
        VALUES (p_player_id, p_game_team_id, p_position_id, p_goals_scored, p_auto_goals_scored, p_fouls);
    ELSE
        UPDATE Statistic
        SET goals_scored      = p_goals_scored,
            auto_goals_scored = p_auto_goals_scored,
            fouls             = p_fouls
        WHERE id = v_stat_id;
    END IF;
END //

DELIMITER ;

CALL RecordGameStats(5, 3, 1, 2, 0, 1);
