ALTER TABLE Stadium
    CHANGE capacity max_capacity INT;

ALTER TABLE Player
    CHANGE age age SMALLINT;

ALTER TABLE Player
    CHANGE name full_name VARCHAR(512);