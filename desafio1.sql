DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE DATABASE `SpotifyClone`;

USE SpotifyClone;

CREATE TABLE plans (
plan_id INT PRIMARY KEY AUTO_INCREMENT,
`type` VARCHAR(25),
price DECIMAL(5,2)
) engine = InnoDB;

INSERT INTO plans(`type`, price) 
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(25),
age TINYINT,
plan_id INT,
FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

INSERT INTO users(`name`, age, plan_id)
VALUES
('Thati', 23 , 1),
('Cintia', 35 , 2),
('Bill', 20 , 3),
('Roger', 45, 1);

CREATE TABLE artists (
artist_id INT AUTO_INCREMENT,
`name` VARCHAR(25),
CONSTRAINT PRIMARY KEY (artist_id)
) engine = InnoDB;

INSERT INTO artists(`name`)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE albums (
album_id INT AUTO_INCREMENT,
`title` VARCHAR(40),
artist_id INT,
CONSTRAINT PRIMARY KEY (album_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO albums(title, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE songs (
song_id INT AUTO_INCREMENT,
album_id INT,
`title` VARCHAR(40),
CONSTRAINT PRIMARY KEY (song_id),
FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

INSERT INTO songs(album_id, `title`)
VALUES
(1, 'Soul For Us'),
(1, 'Reflections Of Magic'),
(1, 'Dance With Her Own'),
(2, 'Troubles Of My Inner Fire'),
(2, 'Time Fireworks'),
(3, 'Magic Circus'),
(3, 'Honey, So Do I'),
(3, "Sweetie, Let's Go Wild"),
(3, 'She Knows'),
(4, 'Fantasy For Me'),
(4, 'Celebration Of More'),
(4, 'Rock His Everything'),
(4, 'Home Forever'),
(4, 'Diamond Power'),
(4, "Honey, Let's Be Silly"),
(5, 'Thang Of Thunder'),
(5, 'Words Of Her Life'),
(5, 'Without My Streets');

CREATE TABLE history_of_replays(
user_id INT,
song_id INT,
CONSTRAINT PRIMARY KEY (user_id, song_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
) ENGINE = InnoDB;

INSERT INTO history_of_replays(user_id, song_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 13),
(2, 17),
(2, 2),
(2, 15),
(3, 4),
(3, 16),
(3, 6),
(4, 3),
(4, 18),
(4, 11);

CREATE TABLE following_artists(
user_id INT,
artist_id INT,
CONSTRAINT PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) ENGINE = InnoDB;

INSERT INTO following_artists(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
