DROP FUNCTION IF EXISTS GetPlayerCountInTeam;

DELIMITER //

CREATE FUNCTION GetPlayerCountInTeam(
    p_team_id INTEGER
) RETURNS INTEGER
    READS SQL DATA
BEGIN
    DECLARE v_player_count INTEGER;

    SELECT COUNT(*)
    INTO v_player_count
    FROM Player
    WHERE team_id = p_team_id;

    RETURN v_player_count;
END //

DELIMITER ;

SELECT GetPlayerCountInTeam(2);