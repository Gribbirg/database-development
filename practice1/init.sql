CREATE TABLE IF NOT EXISTS Stadium
(
    id       INTEGER NOT NULL AUTO_INCREMENT,
    name     VARCHAR(220),
    capacity INTEGER,
    location VARCHAR(220),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS League
(
    id      INTEGER NOT NULL AUTO_INCREMENT,
    name    VARCHAR(220),
    country VARCHAR(220),
    level   INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Team
(
    id            INTEGER NOT NULL AUTO_INCREMENT,
    name          VARCHAR(220),
    home_venue_id INTEGER,
    league_id     INTEGER,
    FOREIGN KEY (league_id) REFERENCES League (id),
    FOREIGN KEY (home_venue_id) REFERENCES Stadium (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Game
(
    id            INTEGER NOT NULL AUTO_INCREMENT,
    venue_id      INTEGER,
    start_time    DATETIME,
    home_team_id  INTEGER NOT NULL,
    guest_team_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venue_id) REFERENCES Stadium (id),
    FOREIGN KEY (home_team_id) REFERENCES Team (id),
    FOREIGN KEY (guest_team_id) REFERENCES Team (id)
);

CREATE TABLE IF NOT EXISTS EquipmentType
(
    id   INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(220),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Equipment
(
    id              INTEGER NOT NULL AUTO_INCREMENT,
    name            VARCHAR(220),
    type_id         INTEGER NOT NULL,
    expiration_date DATETIME,
    games_count     INTEGER NOT NULL,
    is_available    BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES EquipmentType (id)
);

CREATE TABLE IF NOT EXISTS GameEquipment
(
    game_id      INTEGER NOT NULL,
    equipment_id INTEGER NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment (id),
    PRIMARY KEY (game_id, equipment_id)
);

CREATE TABLE IF NOT EXISTS PlayerPosition
(
    id   INTEGER                                                    NOT NULL AUTO_INCREMENT,
    name VARCHAR(100)                                               NOT NULL,
    type ENUM ('Нападающий', 'Полузащитник', 'Защитник', 'Вратарь') NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS Player
(
    id         INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    team_id    INTEGER,
    age        INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Coach
(
    id               INTEGER NOT NULL AUTO_INCREMENT,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    experience_years INTEGER,
    team_id          INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS OfficialRole
(
    id   INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Official
(
    id               INTEGER NOT NULL AUTO_INCREMENT,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    role_id          INTEGER,
    experience_years INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES OfficialRole (id)
);

CREATE TABLE IF NOT EXISTS GameMatchOfficial
(
    game_id     INTEGER NOT NULL,
    official_id INTEGER NOT NULL,
    PRIMARY KEY (game_id, official_id),
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (official_id) REFERENCES Official (id)
);

CREATE TABLE IF NOT EXISTS Statistic
(
    id                INTEGER NOT NULL AUTO_INCREMENT,
    player_id         INTEGER NOT NULL,
    team_id           INTEGER NOT NULL,
    game_id           INTEGER NOT NULL,
    position_id       INTEGER,
    goals_scored      INTEGER,
    auto_goals_scored INTEGER,
    fouls             INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES Player (id),
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (position_id) REFERENCES PlayerPosition (id),
    FOREIGN KEY (team_id) REFERENCES Team (id)
);
