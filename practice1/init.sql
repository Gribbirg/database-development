DROP DATABASE dbd;
CREATE DATABASE dbd;
USE dbd;

CREATE TABLE If NOT EXISTS Country
(
    id   INTEGER      NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Stadium
(
    id         INTEGER      NOT NULL AUTO_INCREMENT,
    name       VARCHAR(220) NOT NULL,
    capacity   INTEGER      NOT NULL,
    country_id INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES Country (id)
);

CREATE TABLE IF NOT EXISTS League
(
    id         INTEGER      NOT NULL AUTO_INCREMENT,
    name       VARCHAR(220) NOT NULL,
    country_id INTEGER      NOT NULL,
    level      INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES Country (id)
);

CREATE TABLE IF NOT EXISTS Team
(
    id            INTEGER      NOT NULL AUTO_INCREMENT,
    name          VARCHAR(220) NOT NULL,
    home_venue_id INTEGER,
    league_id     INTEGER      NOT NULL,
    FOREIGN KEY (league_id) REFERENCES League (id),
    FOREIGN KEY (home_venue_id) REFERENCES Stadium (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Game
(
    id         INTEGER  NOT NULL AUTO_INCREMENT,
    venue_id   INTEGER  NOT NULL,
    start_time DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venue_id) REFERENCES Stadium (id)
);

CREATE TABLE IF NOT EXISTS GameTeam
(
    game_id INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    home    BOOLEAN NOT NULL,
    PRIMARY KEY (game_id, team_id),
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (team_id) REFERENCES Team (id)
);

CREATE TABLE IF NOT EXISTS EquipmentType
(
    id   INTEGER      NOT NULL AUTO_INCREMENT,
    name VARCHAR(220) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Equipment
(
    id              INTEGER      NOT NULL AUTO_INCREMENT,
    name            VARCHAR(220) NOT NULL,
    type_id         INTEGER      NOT NULL,
    expiration_date DATETIME,
    games_count     INTEGER      NOT NULL,
    is_available    BOOLEAN      NOT NULL,
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

CREATE TABLE IF NOT EXISTS PlayerPositionType
(
    id   INTEGER      NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS PlayerPosition
(
    id      INTEGER      NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    type_id INTEGER      NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES PlayerPositionType (id)
);

CREATE TABLE IF NOT EXISTS Player
(
    id      INTEGER      NOT NULL AUTO_INCREMENT,
    name    VARCHAR(512) NOT NULL,
    team_id INTEGER,
    age     INTEGER      NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Coach
(
    id               INTEGER NOT NULL AUTO_INCREMENT,
    name             VARCHAR(512),
    experience_years INTEGER,
    team_id          INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS OfficialRole
(
    id   INTEGER      NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Official
(
    id               INTEGER      NOT NULL AUTO_INCREMENT,
    name             VARCHAR(512) NOT NULL,
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
