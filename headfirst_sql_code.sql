-- Таблица со страницы 83
CREATE TABLE my_contacts
(
  first_name VARCHAR(20),
  last_name  VARCHAR(20),
  email      VARCHAR(50),
  gender     CHAR(1),
  birthday   DATE,
  profession VARCHAR(50),
  location   VARCHAR(50),
  status     VARCHAR(20),
  interests  VARCHAR(100),
  seeking    VARCHAR(100)
);
--

CREATE DATABASE drinks;

CREATE TABLE easy_drinks
(
  drink_name VARCHAR(20),
  main       VARCHAR(20),
  amount1    DECIMAL(4,2),
  second     VARCHAR(20),
  amount2    DECIMAL(4,2),
  directions VARCHAR(255)
);

INSERT INTO easy_drinks
VALUES
('Терновник', 'тоник', 1.5, 'ананасовый сок', 1,
  'взболтать со льдом, разлить по бокалам, украсить лимонной цедрой'),
('Голубая луна', 'содовая', 1.5, 'черничный сок', .75,
  'взболтать со льдом, разлить по бокалам, украсить лимонной цедрой'),
('Вот тебе на', 'персиковый нектар', 1, 'ананасовый сок', 1,
  'взболтать со льдом, разлить по стаканам'),
('Лаймовый физз', 'спрайт', 1.5, 'сок лайма', .75,
  'взболтать со льдом, разлить по стаканам'),
('Поцелуй', 'вишнёвый сок', 2, 'абрикосовый нектар', 7,
  'подавать со льдом и соломинкой'),
('Горячее золото', 'персиковый нектар', 3, 'апельсиновый сок', 6,
  'влить в кружку горячий апельсиновый сок, добавить персиковый нектар'),
('Одинокое дерево', 'содовая', 1.5, 'вишнёвый сок', .75,
  'взболтать со льдом, разлить по бокалам'),
('Борзая', 'содовая', 1.5, 'грейпфрутовый сок', 5,
  'подавать со льдом, тщательно взболтать'),
('Бабье лето', 'яблочный сок', 2, 'горячий чай', 6,
  'налить сок в кружку, добавить горячий чай'),
('Лягушка','холодный чай', 1.5, 'лимонад', 5,
  'подавать на льду с ломтиком лайма'),
('Сода плюс','содовая', 2, 'виноградный сок', 1,
  'взболтать в бокале, подавать без льда');

--запросы на извлечение (стр. 96)
SELECT * FROM easy_drinks WHERE main = 'спрайт';
SELECT * FROM easy_drinks WHERE main = 'содовая';
SELECT * FROM easy_drinks WHERE amount2 = 6;
SELECT * FROM easy_drinks WHERE second = 'апельсиновый сок';
SELECT * FROM easy_drinks WHERE amount1 < 1.5;
SELECT * FROM easy_drinks WHERE amount2 < '1';
SELECT * FROM easy_drinks WHERE main > 'содовая';
SELECT * FROM easy_drinks WHERE amount1 = '1.5'

--таблица drink_info (стр. 122)
CREATE TABLE drink_info
(
  drink_name VARCHAR(20),
  cost       DECIMAL(4,2),
  carbs      DECIMAL(5,2),
  color      VARCHAR(20),
  ice        CHAR,
  calories   INT(3)
);

INSERT INTO drink_info
VALUES
('Терновник',       3,   8.4,  'желтый',     'Д', 33),
('Голубая луна',    2.5, 3.2,  'синий',      'Д', 12),
('Вот тебе на',     3.5, 8.6,  'оранжевый',  'Д', 35),
('Лаймовый фризз',  2.5, 5.4,  'зеленый',    'Д', 24),
('Поцелуй',         5.5, 42.5, 'фиолетовый', 'Д', 171),
('Горячее золото',  3.2, 32.1, 'оранжевый',  'Н', 135),
('Одинокое дерево', 3.6, 4.2,  'красный',    'Д', 17),
('Борзая',          4,   14,   'желтый',     'Д', 50),
('Бабье лето',      2.8, 7.2,  'коричневый', 'Н', 30),
('Лягушка',         2.6, 21.5, 'бронзовый',  'Д', 80),
('Сода плюс',       3.8, 4.7,  'красный',    'Н', 19);

--Возьми в руку карандаш (стр. 123)
--Цены желтых напитков со льдом, содержащих более 33 калорий.
SELECT cost FROM drink_info
WHERE  ice   = 'Д'
and    color = 'желтый'
and    calories > 33;

--Названия и цвета напитков, содержащих не более 4 граммов углеводов,
----в которые кладется лед.
SELECT drink_name, color FROM drink_info
WHERE carb > 4
and
ice = 'Д';

--Цены напитков, содежащих 80 и более калорий.
SELECT cost FROM drink_info
WHERE calories >= 80;

--Напитки «Борзая» и «Поцелуй», с цветом и информацией об использовании льда,
----но без указания названий напитков в запросе!
SELECT drink_name, color, ice FROM drink_info
WHERE cost >= 3.9;

-- SELECT drink_name FROM easy_drinks
-- WHERE
-- main = 'вишнёвый сок'
-- or
-- second  = 'вишнёвый сок';
--
-- SELECT drink_name FROM easy_drinks
-- WHERE  main = 'апельсиновый сок' or main = 'яблочный сок';
--
-- SELECT drink_name FROM easy_drinks
-- WHERE  main = 'апельсиновый сок' and main = 'яблочный сок';

--Таблица doughnut_rating (стр. 130)
CREATE TABLE doughnut_ratings (
  location VARCHAR(25),
  `time`   TIME,
  `date`   DATE,
  type     VARCHAR (50),
  rating   INT(2),
  comments VARCHAR(50)
);

INSERT INTO doughnut_ratings
VALUES
('Krispy King', ('8:50:00'), ('00-09-27'),
  'с глазурью', 10, 'почти идеально'),
('Duncan\'s Donuts', ('8:59:00'),('00-08-25'), NULL, 6,
  'жирноваты'),
('Starbuzz Coffee', ('19:35:00'), ('00-05-24'), 'с корицей', 5,
  'вчерашние, но вкусные'),
('Duncan\'s Donuts', ('19:03:00'), ('00-04-26'), 'с вареньем', 7,
  'мало варенья');

--запросы со стр.130
SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' AND rating = 10;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' OR rating = 10;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' AND rating = 3;
-- нет совпадений

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' OR rating = 3;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' AND rating = 3;
-- нет совпадений

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' OR rating = 10;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' OR rating = 10;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' AND rating = 3;
-- нет совпадений

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' OR rating = 3;
-- нет совпадений

--запросы со стр. 131
SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' AND rating <> 6;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' AND rating = 3;
-- нет совпадений

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' AND rating >= 6;
-- нет совпадений

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' OR rating > 5;
-- с глазурью / NULL / с вареньем

SELECT type FROM doughnut_ratings
WHERE location = 'Krispy King' OR rating = 3;
-- с глазурью

SELECT type FROM doughnut_ratings
WHERE location = 'Snappy Bagel' OR rating = 6;
-- NULL

--Проверка диапазонов с использованием AND и операторов сравнения
SELECT drink_name FROM drink_info
WHERE calories >= 30
AND calories   <= 60;

SELECT drink_name FROM drink_info
WHERE calories BETWEEN 30 AND 60;

SELECT drink_name FROM drink_info
WHERE calories <30 OR calories >60;

SELECT drink_name FROM drink_info
WHERE calories <=30 OR calories >=60;

SELECT drink_name FROM drink_info
WHERE drink_name BETWEEN 'Д' AND 'О';

SELECT drink_name FROM drink_info
WHERE NOT carbs BETWEEN 3 AND 5;

SELECT drink_name FROM easy_drinks
WHERE amount1 >= 1.50;

SELECT drink_name FROM easy_drinks
WHERE ice = 'Н';

SELECT drink_name FROM easy_drinks
WHERE calories >= 20;

-- Таблица clown_info (стр.155)
CREATE TABLE clown_info (
  name        VARCHAR(20),
  last_seen   VARCHAR(50),
  appearance  VARCHAR(60),
  activities  VARCHAR(40)
);

INSERT INTO clown_info
VALUES
('Элси', 'Дом престарелых Черри Хилл',
  'Ж, рыжие волосы, зеленый костюм, огромные ботинки',
  'шарики, машинки'),

('Пиклз', 'Вечеринка Джека Грина',
  'М, оранжевые волосы, синий костюм, огромные ботинки', 'мим'),

('Снаглз', 'Болмарт',
  'Ж, желтая рубашка, красные штаны', 'рожок, зонтик'),

('Мистер Хобо', 'Цирк BG',
  'М, сигара, черные волосы, маленькая шляпа', 'скрипка'),

('Кларабелл', 'Дом престарелых Бельмонт',
  'Ж, розовые волосы, большой цветок, синее платье', 'кричалки, танцы'),

('Скутер', 'Больница Окленд',
  'М, синие волосы, красный костюм, большой нос', 'шарики'),

('Зиппо', 'Торговый центр Милстоун',
  'Ж, оранжевый костюм, штаны', 'танцы'),

('Бэйб', 'Автошкола Эрла',
  'Ж, розовый костюм с блестками', 'эквилибристика, машинки'),

('Бонзо', NULL ,
  'М, женское платье в горошек', 'пение, танцы'),

('Снифлз', 'Заведение Трейси',
  'М, зелено-фиолетовый костюс, длинный нос', NULL);

--исправления со стр.158
INSERT INTO clown_info
VALUES
('Снаглз', 'Болмарт',
  'Ж, желтая рубашка, синие штаны', 'рожок, зонтик'),

('Мистер Хобо', 'Вечеринка Эрика Грея',
  'М, сигара, черные волосы, маленькая шляпа', 'скрипка'),

('Зиппо', 'Торговый центр Милстоун',
  'Ж, оранжевый костюм, штаны', 'пение, танцы'),

('Бонзо', 'Парк Диксон' ,
  'М, женское платье в горошек', 'пение, танцы'),

('Снифлз', 'Заведение Трейси',
  'М, зелено-фиолетовый костюс, длинный нос', 'разъезжает на машинке');

DELETE FROM clown_info WHERE activities = 'танцы';

INSERT INTO clown_info
VALUES
('Кларабелл', 'Дом престарелых Бельмонт',
  'Ж, розовые волосы, большой цветок, синее платье', 'танцы');

DELETE FROM clown_info
WHERE activities = 'кричалки, танцы'
AND   name       = 'Кларабелл';

--Замена данных в таблицах (стр.170-173)
INSERT INTO drink_info
VALUES
('Поцелуй', 5.5, 42.5, 'фиолетовый', 'Д', 170);
DELETE FROM drink_info WHERE calories = 171;

INSERT INTO drink_info
VALUES
('Терновник', 3, 8.4, 'золотистый', 'Д', 33),
('Борзая',    4,  14, 'золотистый', 'Д', 50);

DELETE FROM drink_info
WHERE color = 'желтый';
--
DELETE FROM drink_info
WHERE cost = 2.50
and cost = 3.50;

INSERT INTO drink_info
VALUES
('Вот тебе на',    4.5, 8.6, 'оранжевый', 'Д', 35),
('Голубая луна',   3.5, 3.2, 'синий',     'Д', 12),
('Лаймовый фризз', 3.5, 5.4, 'зеленый',   'Д', 24);

--
INSERT INTO clown_info
VALUES
('Мистер Хобо', 'Заведение Трейси',
  'М, сигара, черные волосы, маленькая шляпа', 'скрипка');

SELECT FROM clown_info
WHERE activities = 'танцы';

-- Станте командой DELETE (стр.175-176)
DELETE FROM clown_info
WHERE last_seen = 'Больница Окленд';

DELETE FROM clown_info
WHERE activities = 'скрипка';

DELETE FROM clown_info
WHERE last_seen = 'Парк Диксон' AND
name            = 'Мистер Хобо';

DELETE FROM clown_info
WHERE last_seen = 'Больница Окленд' AND
last_seen       = 'Парк Диксон';

DELETE FROM clown_info
WHERE last_seen = 'Больница Окленд' OR
last_seen       = 'Парк Диксон';

DELETE FROM clown_info
WHERE name = 'Мистер Хобо' OR
last_seen  = 'Больница Окленд';

DELETE FROM clown_info
WHERE name = 'Мистер Хобо' AND
last_seen  = 'Заведение Трейси';

SELECT FROM clown_info
WHERE
activities = 'танцы';
INSERT INTO clown_info
VALUES
('Зиппо', 'Торговый центр Милстоун',
  'Ж, оранжевый костюм, штаны', 'танцы, пение');
DELETE FROM clown_info
WHERE
activities = 'танцы';

/*
Команда Update (стр.180)
---- Команда UPDATE начинается с ключевого слова UPDATE
---- далее идёт ИМЯ_ТАБЛИЦЫ
---- SET определяет изменения, вносимые в запись,
---- после идёт ИМЯ_СТОЛБЦА = НОВОЕ ЗНАЧЕНИЕ
---- WHERE ИМЯ_СТОЛБЦА = СТАРОЕ_ЗНАЧЕНИЕ;
----- UPDATE table_name SET type = 'new VALUES' WHERE type = 'old VALUES'
UPDATE doughnut_ratings
SET type = 'глазированные' WHERE type = 'с глазурью';
 */

--страница 182+
INSERT INTO clown_info (appearance)
VALUES
('Мистер Хобо', 'Вечеринка Эрика Грея');

UPDATE clown_info
SET last_seen = 'Заведение Трейси'
WHERE name    = 'Мистер Хобо'
AND last_seen = 'Вечеринка Эрика Грея';

UPDATE clown_info
SET activities = 'пение'
WHERE name     = 'Зиппо';

INSERT INTO clown_info
VALUES
('Бонзо', 'Парк Диксон',
  'М, женское платье в горошек', 'пение, танцы');

INSERT INTO clown_info
VALUES
('Мистер Хобо', 'Вечеринка Эрика Грея',
  'М, сигара, черные волосы, маленькая шляпа', 'скрипка');

UPDATE clown_info
SET appearance = 'Ж, оранжевый костюм, штаны'
WHERE     name = 'Зиппо';

INSERT INTO clown_info
VALUES
('Кларабелл', 'Дом престарелых Бельмонт',
  'Ж, розовые волосы, большой цветок, синее платье', 'кричалки, танцы'),
('Скутер', 'Больница Окленд',
  'М, синие волосы, красный костюм, большой нос', 'шарики');

UPDATE drink_info
SET cost = cost + 1
WHERE drink_name = 'Голубая луна'
OR drink_name    = 'Лаймовый фризз'
OR drink_name    = 'Вот тебе на';

UPDATE drink_info
SET drink_name   = 'Лаймовый Физз'
WHERE drink_name = 'Лаймовый фризз';

UPDATE easy_drinks
SET main   = 'спрайт'
WHERE main = 'Sprite';

-- Глава 4
-- Таблица my_contacts (стр.220)
CREATE TABLE my_contacts (
  contacts_id INT NOT NULL PRIMARY KEY,
  last_name   VARCHAR(30) DEFAULT NULL,
  first_name  VARCHAR(20) DEFAULT NULL,
  email       VARCHAR(50) DEFAULT NULL,
  gender      CHAR(1) DEFAULT NULL,
  birthday    DATE DEFAULT NULL,
  profession  VARCHAR(50) DEFAULT NULL,
  location    VARCHAR(50) DEFAULT NULL,
  status      VARCHAR(20) DEFAULT NULL,
  interests   VARCHAR(100) DEFAULT NULL,
  seeking     VARCHAR(100) DEFAULT NULL,
);

-- стр.223
CREATE TABLE run (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(20),
  last_name  VARCHAR(30),
);
-- команды для проверки
INSERT INTO run (id, first_name, last_name)
VALUES (NULL, 'Марсия', 'Брэди');
-- true

INSERT INTO run (id, first_name, last_name)
VALUES (1, 'Джен', 'Брэди');
-- false (- / * / *)

INSERT INTO run
VALUES ('', 'Бобби', 'Брэди');
-- false (- / * / *)

INSERT INTO run (first_name, last_name)
VALUES ('Синди', 'Брэди');
-- true

INSERT INTO run (id, first_name, last_name)
VALUES (99, 'Питер', 'Брэди');
-- true

-- команда ALTER
ALTER TABLE my_contacts
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (contact_id);

ALTER TABLE clown_info (
  name          VARCHAR(20) NOT NULL,
  last_seen     VARCHAR(30) NOT NULL,
  state         VARCHAR(20) NULL,
  city          VARCHAR(20) NULL,
  street        VARCHAR(25) NULL,
  gender        CHAR NULL,
  dress_up      VARCHAR(20) NULL,
  dress_down    VARCHAR(20) NULL,
  dress_feather VARCHAR(20) NULL,
  balls         CHAR,
  cars          CHAR,
  singer        CHAR,
  dancing       CHAR,
  screaming     CHAR,
  music         CHAR,
  activities    VARCHAR
);
--
ALTER TABLE clown_info
ADD COLUMN phone VARCHAR(10);

-- таблица стр. 238

CREATE TABLE projekts
(
  number INT(11)                NULL DEFAULT NULL,
  descriptionofproj VARCHAR(50) NULL DEFAULT NULL,
  contractoronjob   VARCHAR(10) NULL DEFAULT NULL
);

INSERT INTO projekts
VALUES
  (1, 'покраска дома',     'Мэрфи'),
  (2, 'перестройка кухни', 'Вальдес'),
  (3, 'укладка паркета',   'Келлер'),
  (4, 'кровельные работы', 'Джексон');
--
ALTER TABLE projekts
  RENAME TO project_list;

ALTER TABLE project_list
  CHANGE COLUMN `number` `proj_id` INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (`proj_id`);

ALTER TABLE project_list
  CHANGE COLUMN `descriptionofproj` `proj_desc` VARCHAR(100),
  CHANGE COLUMN contractoronjob con_name VARCHAR(30);

ALTER TABLE project_list
  MODIFY COLUMN `proj_desc` VARCHAR(120);

ALTER TABLE project_list
  ADD COLUMN `start_date` DATE,
  ADD COLUMN `est_cost`   DECIMAL(8,2),
  ADD COLUMN `con_phone`  VARCHAR(14);

ALTER TABLE project_list
  MODIFY `est_cost` DECIMAL(7,2);

ALTER TABLE project_list
  DROP COLUMN `start_date`;

-- таблица автомобилей стр.251

CREATE TABLE hooptie
(
    color   VARCHAR(20)  NULL,
    year    INT(4)       NULL,
    make    VARCHAR(10)  NULL,
    mo      VARCHAR(20)  NULL,
    howmuch DECIMAL(8,3) NULL
);

INSERT INTO hooptie
VALUES
  ('серебристый', 1998, 'Porsche',  'Boxter',   17992.54),
  (NULL,          2000, 'Jaguar',   'XJ',       15995),
  ('красный',     2002, 'Cadillac', 'Escalade', 40215.9);

/*
 *  CREATE TABLE staff (
 *  PRIMARY KEY (staff_num),
 *  staff_num      INT(5)       NOT NULL,
 *  first_name     VARCHAR(100) NOT NULL,
 *  pens_in_drawer INT(2)       NOT NULL,
 *                 CONSTRAINT pens_in_drawer_range
 *                 CHECK(pens_in_drawer BETWEEN 1 AND 99)
 *  );
 */

-- Переименовываем таблицу
ALTER TABLE hooptie
RENAME TO   car_table;

-- Добавляем первичный ключ
ALTER TABLE car_table
ADD COLUMN car_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (car_id);

-- Добавляем колонку с VIN номером и размещаем второй позицией
ALTER TABLE car_table
ADD COLUMN VIN VARCHAR(16) AFTER car_id;

-- Переименонываем колонку 'mo' на 'model'
ALTER TABLE car_table
CHANGE COLUMN mo model VARCHAR(20);

-- Перемещение столбца 'color'
ALTER TABLE car_table
MODIFY COLUMN color VARCHAR(20) AFTER model;

-- Перемещение столбца 'year'
ALTER TABLE car_table
MODIFY COLUMN year INT(4) AFTER color;

-- Переименовываем 'howmuch' на 'price'
ALTER TABLE car_table
CHANGE COLUMN howmuch price DECIMAL(7,2);

-- Итог:
ALTER TABLE hooptie
  RENAME TO car_table;
ALTER TABLE car_table
  ADD    COLUMN car_id        INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (car_id);
ALTER TABLE car_table
  ADD    COLUMN VIN           VARCHAR(16) AFTER car_id,
  CHANGE COLUMN mo model      VARCHAR(20),
  MODIFY COLUMN color         VARCHAR(20) AFTER model,
  MODIFY COLUMN year          INT    (4) AFTER color,
  CHANGE COLUMN howmuch price DECIMAL(7,2);

-- 'car_table' с нуля
  CREATE TABLE `car_table` (
  `car_id` int          NOT NULL AUTO_INCREMENT,
  `VIN`    VARCHAR(16)  DEFAULT NULL,
  `make`   VARCHAR(10)  DEFAULT NULL,
  `model`  VARCHAR(20)  DEFAULT NULL,
  `color`  VARCHAR(20)  DEFAULT NULL,
  `year`   int          DEFAULT NULL,
  `price`  DECIMAL(7,2) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
);

-- 1НФ my_contacts
CREATE TABLE `my_contacts`
(
  last_name  VARCHAR(30)  DEFAULT NULL,
  first_name VARCHAR(20)  DEFAULT NULL,
  email      VARCHAR(50)  DEFAULT NULL,
  gender     CHAR(1)      DEFAULT NULL,
  birthday   DATE         DEFAULT NULL,
  profession VARCHAR(50)  DEFAULT NULL,
  location   VARCHAR(50)  DEFAULT NULL,
  status     VARCHAR(20)  DEFAULT NULL,
  interests  VARCHAR(100) DEFAULT NULL,
  seeking    VARCHAR(100) DEFAULT NULL
);

/* Шаблон для значений 'my_contacts' до окончания команды
 * last_name, first_name, email, gender,
 * birthday, profession, location,
 * status, interests, seeking
 */

INSERT INTO `my_contacts`
VALUES
('Anderson', 'Jillian', 'jill_anderson@breakneckpizza.com', 'F',
    '1980-09-05', 'Technical Writer', 'Palo Alto, CA',
    'single', 'kayaking, reptiles', 'relationship, friends'),

('Kenton', 'Leo', 'lkenton@starbuzzcoffee.com', 'M',
    '1974-01-10', 'Manager', 'San Francisco, CA',
    'divorced', 'women', 'women to date'),

('McGavin', 'Darrin', 'captainlove@headfirsttheater.com', 'M',
    '1966-01-23', 'Cruise Ship Captain', 'San Diego, CA',
    'single', 'sailing, fishing, yachting', 'women for relationships'),

('Franklin', 'Joe', 'joe_franklin@leapinlimos.com', 'M',
    '1977-04-28', 'Software Sales', 'Dallas, TX',
    'married', 'fishing, drinking', 'new job'),

('Hamilton', 'Jamie', 'dontbother@starbuzzcoffee.com', 'F',
    '1964-09-10', 'System Administrator', 'Princeton, NJ',
    'married', 'RPG', 'nothing'),

('Chevrolet', 'Maurice', 'bookman4u@objectville.net', 'M',
    '1962-07-01', 'Bookshop Owner', 'Mountain View, CA',
    'married', 'collecting books, scuba diving', 'friends'),

('Kroger', 'Renee', 'poorrenee@mightygumball.net', 'F',
    '1976-12-03', 'Unemployed', 'San Francisco, CA',
    'divorced', 'cooking', 'employment'),

('Mendoza', 'Angelina', 'angelina@starbuzzcoffee.com', 'F',
    '1979-08-19', 'UNIX Sysadmin', 'San Francisco, CA',
    'married', 'acting, dancing', 'new job'),

('Murphy', 'Donald', 'padraic@tikibeanlounge.com', 'M',
    '1967-01-23', 'Computer Programmer', 'New York City, NY',
    'committed relationsh', 'RPG, anime', 'friends'),

('Spatner', 'John', 'jpoet@objectville.net', 'M',
    '1963-04-18', 'Salesman','Woodstock, NY',
    'married', 'poetry, screenwriting', 'nothing');

INSERT INTO `my_contacts`
  (
    `last_name`, `first_name`, `email`, `gender`,
    `birthday`, `profession`, `location`
  )
VALUES
  ('Toth', 'Anne',  'Anne_Toth@leapinlimos.com', 'F',
      '1969-11-18', 'Artist', 'San Fran, CA'),

  ('Manson', 'Anne', 'am86@objectville.net', 'F',
      '1977-08-09',  'Baker', 'Seattle, WA'),

  ('Hardy', 'Anne', 'anneh@b0tt0msup.com', 'F',
      '1963-04-18', 'Teacher', 'San Fran, CA'),

  ('Parker', 'Anne', 'annep@starbuzzcoffee.com', 'F',
      '1983-01-10',  'Student', 'San Fran, CA'),

  ('Blunt', 'Anne', 'anneblunt@breakneckpizza.com', 'F',
      '1959-10-09', 'Web Designer', 'San Fran, CA'),

  ('Jacobs', 'Anne', 'anne99@objectville.net', 'F',
      '1968-02-05',  'Computer Programmer', 'San Jose, CA');

ALTER TABLE my_contacts
  ADD COLUMN `city`  VARCHAR(50) DEFAULT NULL,
  ADD COLUMN `state` CHAR(2)     DEFAULT NULL;

ALTER TABLE my_contacts
  ADD COLUMN `contact_id` INT NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY(contact_id);

-- изменение названия города
UPDATE my_contacts
SET location = 'San Francisco, CA'
WHERE location = 'San Fran, CA';

-- возврат штата в отдельную колонку (city, STATE)
SELECT RIGHT (location, 2) FROM my_contacts;

-- возврат названия города (CITY, state)
SELECT SUBSTRING_INDEX(location, ',', 1)
FROM my_contacts;

-- Добавляем колонки в my_contacts
ALTER TABLE my_contacts
ADD COLUMN city VARCHAR(50) DEFAULT NULL,
ADD COLUMN state CHAR(2)    DEFAULT NULL;

-- Обновляем информацию в 'state' и 'city' из 'location'
UPDATE my_contacts
SET state = RIGHT(location, 2);

UPDATE my_contacts
SET city = SUBSTRING_INDEX(location, ',', 1);

/*
 *  Удаляем 'location'
 *  ALTER TABLE my_contacts
 *  DROP COLUMN location;
 */

-- создание таблицы movie_table (271)
CREATE TABLE movie_table (
    title    VARCHAR(50) DEFAULT NULL,
    rating   CHAR(2)     DEFAULT NULL,
    drama    CHAR(1)     DEFAULT NULL,
    comedy   CHAR(1)     DEFAULT NULL,
    action   CHAR(1)     DEFAULT NULL,
    gore     CHAR(1)     DEFAULT NULL,
    scifi    CHAR(1)     DEFAULT NULL,
    for_kids CHAR(1)     DEFAULT NULL,
    cartoon  CHAR(1)     DEFAULT NULL,
    category VARCHAR(25) DEFAULT NULL
);

-- внесение данных в movie_table (271)
INSERT INTO movie_table
VALUES
  ('Большое приключение',          'G', 'Н', 'Н', 'Н',
        'Н', 'Н', 'Н', 'Д', ''),
  ('Грег: неизвестные истории',   'PG', 'Н', 'Н', 'Д',
        'Н', 'Н', 'Н', 'Н', ''),
  ('Безумные клоуны',              'R', 'Н', 'Н', 'Н',
        'Д', 'Н', 'Н', 'Н', ''),
  ('Параскеведекатриафобия',       'R', 'Д', 'Д', 'Д',
        'Н', 'Д', 'Н', 'Н', ''),
  ('Крыса по имени Дарси',         'G', 'Н', 'Н', 'Н',
        'Н', 'Д', 'Н', 'Н', ''),
  ('Конец очереди',                'R', 'Д', 'Н', 'Н',
        'Д', 'Д', 'Н', 'Д', ''),
  ('Блестящие вещи',              'PG', 'Д', 'Н', 'Н',
        'Н', 'Н', 'Н', 'Н', ''),
  ('Заберите обратно',             'R', 'Н', 'Д', 'Н',
        'Н', 'Н', 'Н', 'Н', ''),
  ('Наживка для акул',             'G', 'Н', 'Н', 'Н',
        'Н', 'Н', 'Д', 'Н', ''),
  ('Разгеванный пират',           'PG', 'Н', 'Д', 'Н',
        'Н', 'Н', 'Н', 'Д', ''),
  ('Планета пригодна для жизни',  'PG', 'Н', 'Д', 'Н',
        'Н', 'Д', 'Н', 'Н', '');

-- назначение категории фильма через UPDATE + CASE (273)
UPDATE movie_table
SET category =
  CASE
    WHEN drama       = 'Д' THEN 'драма'
    WHEN comedy      = 'Д' THEN 'комедия'
    WHEN action      = 'Д' THEN 'боевик'
    WHEN gore        = 'Д' THEN 'ужасы'
    WHEN scifi       = 'Д' THEN 'фантастика'
    WHEN for_kids    = 'Д' THEN 'семейное'
    WHEN cartoon     = 'Д'
          AND rating = 'G' THEN 'семейное'
    ELSE 'разное'
END;

-- -- Исправление ошибки
-- UPDATE movie_table
-- SET cartoon = 'Д'
-- WHERE title = 'Большое приключение';
--
-- UPDATE movie_table
-- SET for_kids = 'Н'
-- WHERE title = 'Большое приключение';

ALTER TABLE movie_table
ADD COLUMN movie_id INT AUTO_INCREMENT FIRST,
ADD PRIMARY KEY(`movie_id`);

-- запрос на сортировку
SELECT   contact_id, last_name, first_name
FROM     my_contacts
WHERE    last_name LIKE '%'
ORDER BY last_name;

-- удаление дубликатов из my_contacts
DELETE FROM my_contacts WHERE contact_id = 1;
DELETE FROM my_contacts WHERE contact_id = 2;


-- -- запрос на сортировку
SELECT contact_id, last_name, first_name
FROM my_contacts
ORDER BY last_name;

SELECT* FROM my_contacts
ORDER BY birthday;

-- Задание (286)
CREATE TABLE test_t
(
  test_chars CHAR(1) DEFAULT NULL
);

INSERT INTO test_t
VALUES
(0), (1), (2), (3),
('A'), ('B'), ('C'), ('D'),
('a'), ('b'), ('c'), ('d'),
('!'), ('@'), ('#'), ('$'),
('%'), ('^'), ('&'), ('*'),
('('), (')'), ('-'), ('_'),
('+'), ('='), ('['), (']'),
('{'), ('}'), (';'), (':'),
('\''), ('"'),('|'), ('`'),
('~'), ('.'), (','), ('/'),
('<'), ('>'), ('?'), ('\ '),
(''), (' '), (NULL);

-- добавление столбца 'purshased' в movie_table
ALTER TABLE movie_table
ADD COLUMN purshased DATE;

SELECT title, category
FROM movie_table
ORDER BY title ASC, category DESC;

-- таблица 'cookie_sales'
CREATE TABLE cookie_sales (
  ID         int(11)      NOT NULL AUTO_INCREMENT,
  first_name varchar(20)  NOT NULL,
  sales      decimal(4,2) NOT NULL,
  sale_date  date         NOT NULL,
  PRIMARY KEY  (ID)
);

INSERT INTO `cookie_sales`
   (`ID`,`first_name`,`sales`,`sale_date`)
VALUES
   ('1',  'Линдси', 32.02, '2007-03-12'),
   ('2',  'Николь', 26.53, '2007-03-12'),
   ('3',  'Бритни', 11.25, '2007-03-12'),
   ('4',  'Эшли',   18.96, '2007-03-12'),
   ('5',  'Линдси',  9.16, '2007-03-11'),
   ('6',  'Николь',  1.52, '2007-03-11'),
   ('7',  'Бритни', 43.21, '2007-03-11'),
   ('8',  'Эшли',    8.05, '2007-03-11'),
   ('9',  'Линдси', 17.62, '2007-03-10'),
   ('10', 'Николь', 24.19, '2007-03-10'),
   ('11', 'Бритни',  3.40, '2007-03-10'),
   ('12', 'Эшли',   15.21, '2007-03-10'),
   ('13', 'Линдси',  0.00, '2007-03-09'),
   ('14', 'Николь', 31.99, '2007-03-09'),
   ('15', 'Бритни',  2.58, '2007-03-09'),
   ('16', 'Эшли',    0.00, '2007-03-09'),
   ('17', 'Линдси',  2.34, '2007-03-08'),
   ('18', 'Николь', 13.44, '2007-03-08'),
   ('19', 'Бритни',  8.78, '2007-03-08'),
   ('20', 'Эшли',   26.82, '2007-03-08'),
   ('21', 'Линдси',  3.71, '2007-03-07'),
   ('22', 'Николь',  0.56, '2007-03-07'),
   ('23', 'Бритни', 34.19, '2007-03-07'),
   ('24', 'Эшли',    7.77, '2007-03-07'),
   ('25', 'Линдси', 16.23, '2007-03-06'),
   ('26', 'Николь',  0.00, '2007-03-06'),
   ('27', 'Бритни',  4.50, '2007-03-06'),
   ('28', 'Эшли',   19.22, '2007-03-06');

-- запрос на извлечение суммы продаж Николь
SELECT SUM(sales)
FROM   cookie_sales
WHERE  first_name = 'Николь';

-- команда на извлечение суммы продаж каждой девочки
SELECT   first_name, SUM(sales)
FROM     cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC;

-- команда на извлечение средней выручки за день
SELECT   first_name, AVG(sales)
FROM     cookie_sales
GROUP BY first_name;
--
SELECT   first_name, SUM(sales), MIN(sales),
         AVG(sales), MAX(sales), COUNT(sales)
FROM     cookie_sales
GROUP BY first_name;
--
SELECT   first_name, COUNT(sales)
FROM     cookie_sales
GROUP BY first_name;
--
SELECT DISTINCT sale_date
FROM            cookie_sales
ORDER BY        sale_date;
--
SELECT DISTINCT sale_date, first_name
FROM            cookie_sales
ORDER BY        first_name;
--
SELECT COUNT(DISTINCT sale_date)
FROM   cookie_sales;
--
SELECT COUNT(DISTINCT first_name)
FROM   my_contacts;
--
SELECT DISTINCT sale_date, first_name
FROM            cookie_sales
ORDER BY        first_name;
--
SELECT   first_name, SUM(sales), MIN(sales),
         AVG(sales), MAX(sales), COUNT(sales)
FROM     cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC;
--
SELECT   first_name, SUM(sales), MIN(sales),
         AVG(sales), MAX(sales), COUNT(sales)
FROM     cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC
LIMIT 2;

SELECT   first_name, SUM(sales), MIN(sales),
         AVG(sales), MAX(sales), COUNT(sales)
FROM     cookie_sales
GROUP BY first_name
ORDER BY SUM(sales) DESC
LIMIT 1,1;

-- локализация таблицы my_contact через UPDATE
CREATE TABLE my_contact_2
(
  фамилия          VARCHAR(30)   DEFAULT NULL,
  имя              VARCHAR(20)   DEFAULT NULL,
  email            VARCHAR(50)   DEFAULT NULL,
  пол              CHAR(1)       DEFAULT NULL,
  день_рождения    DATE          DEFAULT NULL,
  профессия        VARCHAR(30)   DEFAULT NULL,
  место_жительства VARCHAR(30)   DEFAULT NULL,
  статус           VARCHAR(10)   DEFAULT NULL,
  интересы         VARCHAR (100) DEFAULT NULL,
  ищет             VARCHAR(100)  DEFAULT NULL
);

INSERT INTO my_contact_2
VALUES
('Андерсон', 'Джиллиан', 'jill_anderson@breakneckpizza.com', 'Ж',
    '1980-09-05', 'Писатель', 'Palo Alto, CA',
    'свободна', 'каяк, рептилии', 'отношения, друзья'),

('Кентон', 'Лео', 'lkenton@starbuzzcoffee.com', 'М',
    '1974-01-10', 'Менеджер', 'San Francisco, CA',
    'разведен', 'женщины', 'свидания'),

('МакГавин', 'Даррин', 'captainlove@headfirsttheater.com', 'М',
    '1966-01-23', 'Капитан', 'San Diego, CA',
    'не женат', 'плаванье, рыбалка, яхтинг', 'свидания'),

('Франклин', 'Джо', 'joe_franklin@leapinlimos.com', 'М',
    '1977-04-28', 'Продавец', 'Dallas, TX',
    'женат', 'рыбалка, выпивка', 'новая работа'),

('Гамильтон', 'Джейми', 'dontbother@starbuzzcoffee.com', 'Ж',
    '1964-09-10', 'Системный администратор', 'Princeton, NJ',
    'замужем', 'RPG', 'ничего'),

('Шевроле', 'Маурисио', 'bookman4u@objectville.net', 'M',
    '1962-07-01', 'Владелец магазина', 'Mountain View, CA',
    'женат', 'книги, скуба дайвинг', 'друзья'),

('Крогер', 'Рене', 'poorrenee@mightygumball.net', 'Ж',
    '1976-12-03', 'Безработный', 'San Francisco, CA',
    'разведен', 'готовка', 'занятие'),

('Мендоза', 'Анджелина', 'angelina@starbuzzcoffee.com', 'Ж',
    '1979-08-19', 'UNIX администратор', 'San Francisco, CA',
    'замужем', 'театр, танцы', 'новая работа'),

('Мерфи', 'Дональд', 'padraic@tikibeanlounge.com', 'M',
    '1967-01-23', 'Программист', 'New York City, NY',
    'женат', 'RPG, анимэ', 'друзья'),

('Спетнер', 'Джон', 'jpoet@objectville.net', 'M',
    '1963-04-18', 'Продавец','Woodstock, NY',
    'женат', 'поэзия, сценарии', 'ничего');

INSERT INTO `my_contact_2`
  (
    `фамилия`, `имя`, `email`, `пол`,
    `день_рождения`, `профессия`, `место_жительства`
  )
VALUES
  ('Тот', 'Энн',  'Anne_Toth@leapinlimos.com', 'Ж',
      '1969-11-18', 'Артист', 'San Francisco, CA'),

  ('Мэнсон', 'Энн', 'am86@objectville.net', 'Ж',
      '1977-08-09',  'Пекарь', 'Seattle, WA'),

  ('Харди', 'Энн', 'anneh@b0tt0msup.com', 'Ж',
      '1963-04-18', 'Учитель', 'San Francisco, CA'),

  ('Паркер', 'Энн', 'annep@starbuzzcoffee.com', 'Ж',
      '1983-01-10',  'Стедент', 'San Francisco, CA'),

  ('Блант', 'Энн', 'anneblunt@breakneckpizza.com', 'Ж',
      '1959-10-09', 'Веб дизайнер', 'San Francisco, CA'),

  ('Джейкобс', 'Энн', 'anne99@objectville.net', 'Ж',
      '1968-02-05',  'Программист', 'San Jose, CA');

/* изменения в таблице my_contact_2
 * добавление столбцов "штат" и "город" после профессии
 * минорные исправления в орфографии
 * разделение интересов и поиска по разным столбцам
 */
-- добавление колонок "город" и "штат"
ALTER TABLE my_contact_2
ADD COLUMN город VARCHAR(30) AFTER профессия,
ADD COLUMN штат  CHAR(2)     BEFORE 'статус';

-- исправления в поле F/M на Ж/М
UPDATE my_contact_RUS
SET    пол = 'Ж'
WHERE  пол = 'F';

UPDATE my_contact_RUS
SET    пол = 'М'
WHERE  пол = 'M';

ALTER TABLE my_contacts
  ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,
  PRIMARY KEY('contact_id');

ALTER TABLE my_contacts
  ADD COLUMN interest1 VARCHAR(20) AFTER seeking,
  ADD COLUMN interest2 VARCHAR(20) AFTER interest1,
  ADD COLUMN interest3 VARCHAR(20) AFTER interest2,
  ADD COLUMN interest4 VARCHAR(20) AFTER interest3;

--запрос
SELECT SUBSTRING_INDEX(interests, ',', 1)
FROM my_contacts;
-- команда 1
UPDATE my_contacts
SET interest1 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts
SET
  interests =
    TRIM(RIGHT(interests,(LENGTH(interests))-(LENGTH(interest1)+1)));

UPDATE my_contact_RUS
SET штат = RIGHT (место_жительства, 2);

-- удаление "место_жительства"
ALTER TABLE my_contact_RUS
DROP COLUMN 'место_жительства';

<<<<<<< new_try
-- команда 2
UPDATE my_contacts
SET interest2 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts
SET
  interests =
    TRIM(RIGHT(interests,(LENGTH(interests))-(LENGTH(interest2)+1)));

-- команда 3
UPDATE my_contacts
SET interest3 = SUBSTRING_INDEX(interests, ',', 1);
UPDATE my_contacts
SET
  interests =
    TRIM(RIGHT(interests,(LENGTH(interests))-(LENGTH(interest3)+1)));

ALTER TABLE my_contacts
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (contact_id);

-- ALTER TABLE my_contacts
-- DROP COLUMN location;
--
-- UPDATE my_contacts
-- SET interests = NULL
-- WHERE interests = 'ы';
-- WHERE interests = 'G',
-- WHERE interests = 'а';
--
-- ALTER TABLE my_contacts
--   ADD COLUMN city VARCHAR(30),
--   ADD COLUMN state VARCHAR(2);
--
-- UPDATE my_contacts
-- SET city = SUBSTRING_INDEX(location, ',', 1);
--
-- UPDATE my_contacts
-- SET state = RIGHT (location, 2);

-- создание таблицы intersts (337) c внешним ключом
CREATE TABLE interests (
  int_id     INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
  intersts   VARCHAR(50) NOT NULL,
  contact_id INT         NOT NULL,
  CONSTRAINT my_contacts_contact_id_fk
  /* CONSTRAINT - это ограничение.
    Ограничению присваивается имя, по которому можно определить
    из какой таблицы взят ключ (my_contacts),
    как он называется (contact_id) и что
    ключ является внешним (fk, от Foreign Key).
    MUL - означает, что одно значение может храниться
    в столбце в нескольких экземплярах.
  */
  FOREIGN KEY (contact_id)
  REFERENCES my_contacts (contact_id)
);

-- Таблица с обувью и женщинами
CREATE TABLE woman (
  woman_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
  woman_name VARCHAR(10) DEFAULT NULL,
);

INSERT INTO woman (woman_name)
  VALUES
    ('Кэрри'),
    ('Саманта'),
    ('Шарлотта'),
    ('Миранда');

🤨
CREATE TABLE shoes (
  shoe_id    INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
  shoes_name VARCHAR(10) DEFAULT NULL,
  woman_id   INT         NOT NULL,
  CONSTRAINT             woman_woman_id_fk
  FOREIGN KEY                   (woman_id)
  REFERENCES             woman  (woman_id)
);
INSERT INTO `shoes` (`shoes_name`)
VALUES
  ('Сандали'),
  ('Сабо'),
  ('Шлепанцы'),
  ('Туфли');
-- ERROR 1364 (HY000): Field 'woman_id' doesn't have a default value --

-- таблица супергероев
CREATE TABLE super_heroes (
  name       VARCHAR(20) NOT NULL,
  power      VARCHAR(50) NOT NULL default '',
  weakness   VARCHAR(20) NOT NULL default '',
  city       VARCHAR(20) NOT NULL,
  country    VARCHAR(20) NOT NULL,
  arch_enemy VARCHAR(50) NOT NULL,
  initials   VARCHAR (2) NOT NULL
);

INSERT INTO `super_heroes`
(`name`,`power`,`weakness`,`city`,`country`,`arch_enemy`,`initials`)
VALUES
 ('Super Trashman','Cleans quickly','bleach',
   'Gotham','US','Verminator','ST'),
 ('The Broker','Makes money from nothing','',
   'New York','US','Mister Taxman','TB'),
 ('Super Guy','Flies','birds',
   'Metropolis','US','Super Fella','SG'),
 ('Wonder Waiter','Never forgets an order','insects',
   'Paris','France','All You Can Eat Girl','WW'),
 ('Dirtman','Creates dust storms','bleach',
   'Tulsa','US','Hoover','D'),
 ('Super Guy','Super strength','aluminum',
   'Metropolis','US','Badman','SG'),
 ('Furious Woman','Gets really, really angry','',
   'Rome','Italy','The Therapist','FW'),
 ('The Toad','Tongue of Justice','insects',
   'London','England','Heron','T'),
 ('Librarian','Can find anything','children',
   'Springfield','US','Chaos Creep','L'),
 ('Goose Girl','Flies','',
   'Minneapolis','US','The Quilter','GG'),
 ('Stick Man','Stands in for humans','hang man',
   'London','England','Eraserman','SM');
