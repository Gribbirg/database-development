DROP FUNCTION IF EXISTS IsEquipmentAvailable;

DELIMITER //

CREATE FUNCTION IsEquipmentAvailable(
    p_equipment_id INTEGER
) RETURNS BOOLEAN
    READS SQL DATA
BEGIN
    DECLARE v_availability BOOLEAN;

    SELECT is_available
    INTO v_availability
    FROM Equipment
    WHERE id = p_equipment_id;

    RETURN IFNULL(v_availability, FALSE);
END //

DELIMITER ;

SELECT IsEquipmentAvailable(1);
