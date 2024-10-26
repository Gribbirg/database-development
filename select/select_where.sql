SELECT *
FROM player
WHERE age = 25;

SELECT *
FROM player
WHERE age > 25;

SELECT *
FROM player
WHERE age >= 25;

SELECT *
FROM player
WHERE age < 25;

SELECT *
FROM player
WHERE age <= 25;

SELECT *
FROM player
WHERE age != 25;

SELECT *
FROM team
WHERE home_venue_id IS NOT NULL;

SELECT *
FROM team
WHERE home_venue_id IS NULL;

SELECT *
FROM player
WHERE age BETWEEN 25 and 28;

SELECT *
FROM player
WHERE age IN (25, 28);

SELECT *
FROM player
WHERE age NOT IN (25, 28);

SELECT *
FROM player
WHERE name LIKE 'Lu%';

SELECT *
FROM player
WHERE name LIKE 'Lucas S_lva';