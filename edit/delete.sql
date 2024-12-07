DELETE
FROM Player
WHERE id = 5;

DELETE
FROM Game
WHERE start_time < NOW();

DELETE
FROM Equipment
WHERE is_available = FALSE;