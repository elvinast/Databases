-- 1) Create the following tables «movies» and «theaters»:
CREATE TABLE movies (
  id     SERIAL PRIMARY KEY,
  title  VARCHAR(255) NOT NULL UNIQUE,
  rating INTEGER,
  genre  VARCHAR(50)  NOT NULL
);
INSERT INTO movies VALUES
  (DEFAULT, 'Citizen Kane', 5, 'Drama'),
  (DEFAULT, 'Singin'' in the Rain', 7, 'Comedy'),
  (DEFAULT, 'The Wizard of Oz ', 7, 'Fantasy'),
  (DEFAULT, 'The Quiet Man', NULL, 'Comedy'),
  (DEFAULT, 'North by Northwest', NULL, 'Thriller'),
  (DEFAULT, 'The Last Tango in Paris', 9, 'Drama'),
  (DEFAULT, 'Some Like it Hot', 4, 'Comedy'),
  (DEFAULT, 'A Night at the Opera', NULL, 'Comedy');

CREATE TABLE theaters (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  size INTEGER      NOT NULL CHECK (size >= 3),
  city VARCHAR(50)  NOT NULL
);
INSERT INTO theaters VALUES
  (DEFAULT, 'Kinopark Esentai', 15, 'Almaty'),
  (DEFAULT, 'Star Cinema Mega ', 7, 'Almaty'),
  (DEFAULT, 'Kinopark 8', 9, 'Shymkent'),
  (DEFAULT, 'Star Cinema 15', 11, 'Astana'),
  (DEFAULT, 'Cinemax', 4, 'Aktau');

-- 2) Select the names of only one movie from each genre.
select distinct on (genre) title from movies;


-- 3) Select the top 3 movies by rating.
select * from movies order by rating desc nulls last limit 3;

-- 4) Select the third biggest theater by size.
select * from theaters order by size desc offset 2 limit 1;


-- 5) Select all unrated movies.
select * from movies where rating is null;


-- 6) Select theaters from Almaty and Shymkent with rating greater than 7.
select * from theaters where size > 7 and city in ('Almaty','Shymkent');


-- 7) Show all movies in the following format with aliases
select id as "Movie ID", format('The genre of %s is %s', title, genre) as "MovieInfo" from movies;


-- 8) Create table named «movietheaters» with pair primary key (theater_id and movie_id):
CREATE TABLE movietheaters (
  theater_id INTEGER REFERENCES theaters,
  movie_id   INTEGER REFERENCES movies,
  rating     INTEGER,
  PRIMARY KEY (theater_id, movie_id)
);
INSERT INTO movietheaters VALUES (1, 5, 5), (3, 1, 7), (1, 3, 9), (4, 6, 6), (2, 3, 5), (4, 4, 7);


-- 9) Select all theaters that are not currently showing a movie.
select * from theaters where id not in (select theater_id from movietheaters);


-- 10) Select all movies by dividing to three categories (if NULL print «No rating»):
  -- 1) Low rating (0-3);
  -- 2) Medium rating (4-7);
  -- 3) High rating (8-10)
SELECT
  *,
  CASE
    WHEN rating BETWEEN 0 AND 3
      THEN 'Low rating'
    WHEN rating BETWEEN 4 AND 7
      THEN 'Medium rating'
    WHEN rating BETWEEN 8 AND 10
      THEN 'High rating'
    ELSE 'No rating'
  END AS category
FROM movies;


-- 11) Set the rating of all unrated movies to 1.
update movies set rating = 1 where rating is null;


-- 12) Remove all movies not currently showing in theaters.
DELETE FROM movies WHERE id not in (SELECT movie_id FROM movietheaters);


-- 13) Select all movies which has name with following pattern:
  -- First letter is ’T’,
  -- third letter is ‘e’ and end with letter ’n’.
SELECT * From movies WHERE title LIKE ('T_e%n');


-- 14) Select average rating of each genre.
select avg(rating) from movies group by genre;


-- 15) Select theaters which currently showing more than 1 movie.
SELECT * FROM theaters WHERE id in (SELECT theater_id FROM movietheaters GROUP BY theater_id HAVING count(theater_id)>1);










