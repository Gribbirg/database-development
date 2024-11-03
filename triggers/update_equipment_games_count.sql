DELIMITER $$

CREATE TRIGGER UpdateEquipmentGamesCount
    AFTER INSERT
    ON GameEquipment
    FOR EACH ROW
BEGIN
    UPDATE Equipment
    SET games_count = games_count + 1
    WHERE id = NEW.equipment_id;
END$$

DELIMITER ;
