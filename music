CREATE DATABASE music;

use music;

-- создание таблицы bands
CREATE TABLE bands (
  band_name    VARCHAR(15)  NOT NULL PRIMARY KEY,
  style        VARCHAR(20)  DEFAULT NULL
);

-- заполнение таблицы bands
INSERT INTO bands
VALUES
  ('Metallica', 'thrash');

-- создание таблицы albums / FK album_band
CREATE TABLE albums (
  album_name   VARCHAR(30)
);

--заполнение таблицы albums
INSERT INTO albums VALUES ('ride the lightning');

-- создание таблицы songs / FK album_name
CREATE TABLE songs (
  track_id   INT(5)      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  track_name VARCHAR(30)
);

-- заполнение таблицы songs
INSERT INTO `songs` (`track_name`)
  VALUES
    ('fight fire with fire'),
    ('ride the lightning'),
    ('for whom the bell tolls'),
    ('fade to black'),
    ('trapped under ice'),
    ('escape'),
    ('creeping death'),
    ('the call of ktulu');
