DELIMITER //

CREATE TRIGGER DeletePlayerStatistics
    AFTER DELETE
    ON Player
    FOR EACH ROW
BEGIN
    DELETE FROM Statistic WHERE player_id = OLD.id;
END //

DELIMITER ;
