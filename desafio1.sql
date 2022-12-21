DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artists(
	artist_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
	album_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(45) NOT NULL,
    artist_id TINYINT NOT NULL,
    release_year INT(4),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.plans(
	plan_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan_type VARCHAR(50) NOT NULL,
    plan_value DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
	song_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(50) NOT NULL,
    artist_id TINYINT NOT NULL,
    album_id TINYINT NOT NULL,
    song_duration SMALLINT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
	user_id TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_age TINYINT NOT NULL,
    sign_date DATE NOT NULL,
    plan_id TINYINT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.reproduction_history(
    user_id TINYINT NOT NULL,
    song_id TINYINT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id),
    CONSTRAINT PRIMARY KEY(user_id, song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow_list(
    user_id TINYINT NOT NULL,
    artist_id TINYINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id),
    CONSTRAINT PRIMARY KEY(user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artists(artist_name)
VALUES
	('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
INSERT INTO SpotifyClone.albums(album_name, artist_id, release_year)
VALUES
	('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
    
INSERT INTO SpotifyClone.plans(plan_type, plan_value)
VALUES
	('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.songs(song_name, artist_id, album_id, song_duration)
VALUES
	('BREAK MY SOUL', 1, 1, 279),
    ('VIRGO’S GROOVE', 1, 1, 369),
    ('ALIEN SUPERSTAR', 1, 1, 116),
    ('Don’t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
    ('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ("Samba em Paris", 4, 6, 267),
    ('The Bard’s Song', 5, 7, 244),
    ('Feeling Good', 6, 8, 100);
    
INSERT INTO SpotifyClone.users(user_name, user_age, sign_date, plan_id)
VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.reproduction_history(user_id, song_id, reproduction_date)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.follow_list(user_id, artist_id)
VALUES
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);