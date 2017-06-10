-- http://sqlzoo.net/wiki/JOIN_Quiz_2


-- 1c
SELECT
    name
  FROM
    actor
      INNER JOIN movie ON actor.id = director
  WHERE
    gross < budget;


-- 2e
SELECT
    *
  FROM
    actor
      JOIN casting ON actor.id = actorid
      JOIN movie ON movie.id = movieid;


-- 3c
SELECT
    name,
    COUNT(movieid)
  FROM
    casting
      JOIN actor ON actorid = actor.id
  WHERE
    name LIKE 'John %'
  GROUP BY
    name
  ORDER BY
    2 DESC;


-- 4b
SELECT
    title
  FROM
    movie,
    casting,
    actor
  WHERE
    name = 'Paul Hogan' AND
    movieid = movie.id AND
    actorid = actor.id AND
    ord = 1;


-- 5d
SELECT
    name
  FROM
    movie
      JOIN casting ON actor.id = actorid
      JOIN actor ON movie.id = movieid
  WHERE
    ord = 1 AND
    director = 351;


-- 6c


-- 7b
SELECT
    title,
    yr
  FROM
    movie,
    casting,
    actor
  WHERE
    name = 'Robert De Niro' AND
    movieid = movie.id AND
    actorid = actor.id AND
    ord = 3;
