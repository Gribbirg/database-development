DROP FUNCTION IF EXISTS GetAveragePlayerAge;

DELIMITER //

CREATE FUNCTION GetAveragePlayerAge(
    p_team_id INTEGER
) RETURNS DECIMAL(5, 2)
    READS SQL DATA
BEGIN
    DECLARE v_average_age DECIMAL(5, 2);

    SELECT AVG(age)
    INTO v_average_age
    FROM Player
    WHERE team_id = p_team_id;

    RETURN IFNULL(v_average_age, 0);
END //

DELIMITER ;

SELECT GetAveragePlayerAge(10);