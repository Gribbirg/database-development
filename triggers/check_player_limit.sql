DROP TRIGGER IF EXISTS CheckPlayerLimit;

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

INSERT INTO Player (name, team_id, age)
VALUES ('John Smith', 1, 25),
       ('Michael Johnson', 1, 23),
       ('David Brown', 1, 30),
       ('Chris Davis', 1, 22),
       ('James Wilson', 1, 28),
       ('Daniel Martinez', 1, 24),
       ('Matthew Anderson', 1, 29),
       ('Robert Taylor', 1, 26),
       ('Andrew Thomas', 1, 21),
       ('William Moore', 1, 27),
       ('Anthony Jackson', 1, 20),
       ('Brian White', 1, 32),
       ('Kevin Harris', 1, 33),
       ('Jason Martin', 1, 31),
       ('Justin Garcia', 1, 34),
       ('Ryan Clark', 1, 35),
       ('Steven Lewis', 1, 22),
       ('Eric Lee', 1, 23),
       ('Jonathan Walker', 1, 24),
       ('Brandon Hall', 1, 25),
       ('Thomas Allen', 1, 26),
       ('Patrick Young', 1, 27),
       ('Joshua Hernandez', 1, 28),
       ('Christopher King', 1, 29),
       ('Nicholas Wright', 1, 30);
