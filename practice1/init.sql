CREATE TABLE Venue
(
    id       INTEGER NOT NULL AUTO_INCREMENT,
    name     VARCHAR(220),
    capacity INTEGER,
    location VARCHAR(220),
    PRIMARY KEY (id)
);

CREATE TABLE League
(
    id      INTEGER NOT NULL AUTO_INCREMENT,
    name    VARCHAR(220),
    country VARCHAR(220),
    level   INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE Team
(
    id            INTEGER NOT NULL AUTO_INCREMENT,
    name          VARCHAR(220),
    home_venue_id INTEGER,
    league_id     INTEGER,
    FOREIGN KEY (league_id) REFERENCES League (id),
    FOREIGN KEY (home_venue_id) REFERENCES Venue (id),
    PRIMARY KEY (id)
);

CREATE TABLE Game
(
    id             INTEGER NOT NULL AUTO_INCREMENT,
    venue_id       INTEGER,
    time           DATETIME,
    first_team_id  INTEGER NOT NULL,
    second_team_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venue_id) REFERENCES Venue (id),
    FOREIGN KEY (first_team_id) REFERENCES Team (id),
    FOREIGN KEY (second_team_id) REFERENCES Team (id)
);

CREATE TABLE Equipment
(
    id    INTEGER                                                      NOT NULL AUTO_INCREMENT,
    name  VARCHAR(220),
    type  VARCHAR(220)                                                 NOT NULL,
    state ENUM ('Новый', 'Использованный', 'Резерв', 'Вышел из строя') NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE GameEquipment
(
    game_id      INTEGER NOT NULL,
    equipment_id INTEGER NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment (id),
    PRIMARY KEY (game_id, equipment_id)
);


CREATE TABLE Player
(
    id         INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    position   VARCHAR(50),
    team_id    INTEGER,
    age        INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE Coach
(
    id               INTEGER NOT NULL AUTO_INCREMENT,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    experience_years INTEGER,
    team_id          INTEGER,
    FOREIGN KEY (team_id) REFERENCES Team (id),
    PRIMARY KEY (id)
);

CREATE TABLE Official
(
    id               INTEGER                                                             NOT NULL AUTO_INCREMENT,
    first_name       VARCHAR(100),
    last_name        VARCHAR(100),
    role             ENUM ('Главный судья', 'Ассистент судьи', 'Инспектор', 'Секретарь') NOT NULL,
    experience_years INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE GameMatchOfficial
(
    game_id     INTEGER NOT NULL,
    official_id INTEGER NOT NULL,
    PRIMARY KEY (game_id, official_id),
    FOREIGN KEY (game_id) REFERENCES Game (id),
    FOREIGN KEY (official_id) REFERENCES Official (id)
);

CREATE TABLE Statistic
(
    id           INTEGER NOT NULL AUTO_INCREMENT,
    player_id    INTEGER NOT NULL,
    game_id      INTEGER NOT NULL,
    goals_scored INTEGER,
    fouls        INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (player_id) REFERENCES Player (id),
    FOREIGN KEY (game_id) REFERENCES Game (id)
);
