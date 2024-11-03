DELIMITER //

CREATE TRIGGER CheckPlayerLimit
    BEFORE INSERT
    ON Player
    FOR EACH ROW
BEGIN
    DECLARE v_player_count INT;

    SELECT COUNT(*)
    INTO v_player_count
    FROM Player
    WHERE team_id = NEW.team_id;

    IF v_player_count >= 25 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Достигнуто максимальное количество игроков в команде.';
    END IF;
END //

DELIMITER ;
