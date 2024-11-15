DELIMITER //

CREATE PROCEDURE AddTeamWithCoach(
    IN p_team_name VARCHAR(220),
    IN p_home_venue_id INTEGER,
    IN p_league_id INTEGER,
    IN p_coach_name VARCHAR(512),
    IN p_experience_years INTEGER
)
BEGIN
    DECLARE v_team_count INT;

    SELECT COUNT(*)
    INTO v_team_count
    FROM Team
    WHERE name = p_team_name;

    IF v_team_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Команда с таким именем уже существует.';
    ELSE
        INSERT INTO Team (name, home_venue_id, league_id)
        VALUES (p_team_name, p_home_venue_id, p_league_id);

        SET @new_team_id = LAST_INSERT_ID();

        INSERT INTO Coach (name, experience_years, team_id)
        VALUES (p_coach_name, p_experience_years, @new_team_id);
    END IF;
END //

DELIMITER ;

CALL AddTeamWithCoach('Городские Ястребы', 1, 2, 'Иван Иванов', 5);
