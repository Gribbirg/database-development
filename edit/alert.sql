ALTER TABLE Player
    ADD COLUMN nationality VARCHAR(100);

ALTER TABLE Team
    ADD COLUMN established_year INT;

ALTER TABLE Stadium
    ADD COLUMN construction_year INT;

ALTER TABLE Team
    ADD COLUMN city VARCHAR(100) AFTER name;

ALTER TABLE Player
    ADD COLUMN jersey_number INT AFTER name;

ALTER TABLE Coach
    ADD COLUMN nationality VARCHAR(100) AFTER name;