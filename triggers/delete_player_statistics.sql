DROP TRIGGER IF EXISTS DeletePlayerStatistics;

DELIMITER //

CREATE TRIGGER DeletePlayerStatistics
    BEFORE DELETE
    ON Player
    FOR EACH ROW
BEGIN
    DELETE FROM Statistic WHERE player_id = OLD.id;
END //

DELIMITER ;

DELETE
FROM Player
WHERE id = 1;