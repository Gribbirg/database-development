INSERT INTO Country (name)
VALUES ('Brazil'),
       ('Germany'),
       ('Spain'),
       ('France'),
       ('Italy'),
       ('England'),
       ('Argentina'),
       ('Portugal'),
       ('Netherlands'),
       ('Mexico');

INSERT INTO Stadium (name, capacity, country_id)
VALUES ('Maracanã', 78838, 1),
       ('Allianz Arena', 75000, 2),
       ('Camp Nou', 99354, 3),
       ('Stade de France', 81338, 4),
       ('San Siro', 80018, 5),
       ('Wembley Stadium', 90000, 6),
       ('La Bombonera', 49000, 7),
       ('Estadio da Luz', 64642, 8),
       ('Johan Cruyff Arena', 54990, 9),
       ('Estadio Azteca', 87000, 10);

INSERT INTO League (name, country_id, level)
VALUES ('Brazilian Serie A', 1, 1),
       ('Bundesliga', 2, 1),
       ('La Liga', 3, 1),
       ('Ligue 1', 4, 1),
       ('Serie A', 5, 1),
       ('Premier League', 6, 1),
       ('Argentine Primera División', 7, 1),
       ('Primeira Liga', 8, 1),
       ('Eredivisie', 9, 1),
       ('Liga MX', 10, 1),
       ('Brazilian Serie B', 1, 2),
       ('Ligue 2', 4, 2),
       ('Serie B', 5, 2),
       ('Serie C', 5, 3);

INSERT INTO Team (name, home_venue_id, league_id)
VALUES ('Flamengo', 1, 1),
       ('Bayern Munich', 2, 2),
       ('Barcelona', 3, 3),
       ('Paris Saint-Germain', 4, 4),
       ('AC Milan', 5, 5),
       ('Manchester United', 6, 6),
       ('Boca Juniors', 7, 7),
       ('Benfica', 8, 8),
       ('Ajax', 9, 9),
       ('Club América', 10, 10),
       ('Real Madrid', 3, 3);

INSERT INTO Game (venue_id, start_time)
VALUES (1, '2023-10-10 19:00:00'),
       (2, '2023-10-11 20:00:00'),
       (3, '2023-10-12 18:00:00'),
       (4, '2023-10-13 21:00:00'),
       (5, '2023-10-14 19:30:00'),
       (6, '2023-10-15 20:30:00'),
       (7, '2023-10-16 18:00:00'),
       (8, '2023-10-17 19:00:00'),
       (9, '2023-10-18 21:00:00'),
       (10, '2023-10-19 18:30:00'),
       (3, '2023-10-11 20:00:00');

INSERT INTO GameTeam (game_id, team_id, home)
VALUES (1, 1, TRUE),
       (1, 2, FALSE),
       (2, 3, TRUE),
       (2, 4, FALSE),
       (3, 5, TRUE),
       (3, 6, FALSE),
       (4, 7, TRUE),
       (4, 8, FALSE),
       (5, 9, TRUE),
       (5, 10, FALSE),
       (6, 1, TRUE),
       (6, 3, FALSE),
       (7, 5, TRUE),
       (7, 7, FALSE),
       (8, 9, TRUE),
       (8, 6, FALSE),
       (9, 2, TRUE),
       (9, 4, FALSE),
       (10, 8, TRUE),
       (10, 10, FALSE);

INSERT INTO EquipmentType (name)
VALUES ('Ball'),
       ('Corner Flag'),
       ('Goal Net'),
       ('Referee Whistle'),
       ('Shin Guards'),
       ('Goalkeeper Gloves'),
       ('Jersey'),
       ('Shorts'),
       ('Socks'),
       ('Water Bottles');

INSERT INTO Equipment (name, type_id, expiration_date, games_count, is_available)
VALUES ('Adidas Ball', 1, '2024-01-01', 5, TRUE),
       ('Nike Ball', 1, '2024-02-01', 3, TRUE),
       ('Corner Flag Red', 2, '2025-01-01', 20, TRUE),
       ('Corner Flag Blue', 2, '2025-02-01', 15, TRUE),
       ('Goal Net Standard', 3, '2025-12-01', 10, TRUE),
       ('Whistle Fox 40', 4, '2023-12-31', 25, TRUE),
       ('Shin Guards Puma', 5, '2025-07-01', 8, TRUE),
       ('Goalkeeper Gloves Reusch', 6, '2024-06-01', 12, TRUE),
       ('Jersey Red Team', 7, '2024-11-01', 9, TRUE),
       ('Water Bottle Set', 10, '2024-08-01', 30, TRUE);

INSERT INTO GameEquipment (game_id, equipment_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (3, 4),
       (4, 5),
       (5, 6),
       (6, 7),
       (7, 8),
       (8, 9),
       (9, 10);

INSERT INTO PlayerPositionType (name)
VALUES ('Defense'),
       ('Midfield'),
       ('Attack'),
       ('Goalkeeper');

INSERT INTO PlayerPosition (name, type_id)
VALUES ('Right Back', 1),
       ('Center Back', 1),
       ('Left Back', 1),
       ('Central Midfielder', 2),
       ('Attacking Midfielder', 2),
       ('Right Winger', 3),
       ('Left Winger', 3),
       ('Striker', 3),
       ('Goalkeeper', 4),
       ('Sweeper', 1);

INSERT INTO Player (name, team_id, age)
VALUES ('Lucas Silva', 1, 25),
       ('Max Müller', 2, 28),
       ('Carlos Hernández', 3, 30),
       ('Thierry Dupont', 4, 27),
       ('Giuseppe Rossi', 5, 24),
       ('Jack Thompson', 6, 31),
       ('Diego Pérez', 7, 22),
       ('João Fernandes', 8, 26),
       ('Daan de Vries', 9, 29),
       ('Luis Gómez', 10, 23),
       ('Alex Gómez', 10, 19);

INSERT INTO Coach (name, experience_years, team_id)
VALUES ('Roberto Almeida', 10, 1),
       ('Hans Schneider', 12, 2),
       ('José Martinez', 8, 3),
       ('François Leclerc', 14, 4),
       ('Alessandro Bianchi', 6, 5),
       ('Gareth Edwards', 20, 6),
       ('Sergio González', 15, 7),
       ('Miguel Ferreira', 9, 8),
       ('Willem van Dijk', 11, 9),
       ('Pedro Herrera', 7, 10);

INSERT INTO OfficialRole (name)
VALUES ('Referee'),
       ('Assistant Referee'),
       ('Fourth Official'),
       ('VAR Official');

INSERT INTO Official (name, role_id, experience_years)
VALUES ('John Roberts', 1, 12),
       ('Michael Bauer', 2, 10),
       ('Pablo García', 3, 8),
       ('Étienne Dubois', 4, 9),
       ('David Jones', 1, 15),
       ('Richard Wagner', 2, 13),
       ('Eduardo Morales', 3, 11),
       ('Pierre Laurent', 4, 7),
       ('James Evans', 1, 16),
       ('Franz Weber', 2, 14);

INSERT INTO GameMatchOfficial (game_id, official_id)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (5, 9),
       (5, 10);

INSERT INTO Statistic (player_id, game_team_id, position_id, goals_scored, auto_goals_scored, fouls)
VALUES (1, 1, 1, 2, 0, 1),
       (2, 2, 2, 1, 0, 2),
       (3, 3, 3, 0, 0, 3),
       (4, 4, 4, 0, 1, 1),
       (5, 5, 5, 1, 0, 0),
       (6, 6, 6, 2, 0, 1),
       (7, 7, 7, 1, 0, 2),
       (8, 8, 8, 0, 1, 3),
       (9, 9, 9, 2, 0, 0),
       (10, 10, 10, 0, 0, 1),
       (11, 10, 8, 0, 0, 1);
