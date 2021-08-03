CREATE DATABASE IF NOT EXISTS `SpotifyClone`;

USE SpotifyClone;

CREATE TABLE plans (
plan_id INT PRIMARY KEY AUTO_INCREMENT,
`type` VARCHAR(25) 
) engine = InnoDB;

INSERT INTO plans(`type`) 
VALUES
('gratuito'),
('familiar'),
('universitário');

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

CREATE TABLE songs (
song_id INT AUTO_INCREMENT,
`title` VARCHAR(40),
CONSTRAINT PRIMARY KEY (song_id)
) engine = InnoDB;

INSERT INTO songs(`title`)
VALUES
('Soul For Us'),
('Reflections Of Magic'),
('Dance With Her Own'),
('Troubles Of My Inner Fire'),
('Time Fireworks'),
('Magic Circus'),
('Honey, So Do I'),
("Sweetie, Let's Go Wild"),
('She Knows'),
('Fantasy For Me'),
('Celebration Of More'),
('Rock His Everything'),
('Home Forever'),
('Diamond Power'),
("Honey, Let's Be Silly"),
('Thang Of Thunder'),
('Words Of Her Life'),
('Without My Streets');

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

CREATE TABLE album_song (
album_id INT,
song_id INT,
CONSTRAINT PRIMARY KEY (album_id, song_id),
FOREIGN KEY (album_id) REFERENCES albums(album_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO album_song(album_id, song_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(5, 18);

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