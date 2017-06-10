-- http://sqlzoo.net/wiki/SELECT_Quiz


-- 1c
SELECT
    name,
    population
  FROM
    world
  WHERE
    population BETWEEN 1000000 AND 1250000;


-- 2e
SELECT
    name,
    population
  FROM
    world
  WHERE
    name LIKE "Al%";


-- 3e
SELECT
    name
  FROM
    world
  WHERE
    name LIKE '%a' OR
    name LIKE '%l';


-- 4c
SELECT
    name,
    LENGTH(name)
  FROM
    world
  WHERE
    LENGTH(name) = 5 AND
    region = 'Europe';


-- 5c
SELECT
    name,
    area * 2
  FROM
    world
  WHERE
    population = 64000;


-- 6c
SELECT
    name,
    area,
    population
  FROM
    world
  WHERE
    area > 50000 AND
    population < 10000000;


-- 7c
SELECT
    name,
    population / area
  FROM
    world
  WHERE
    name IN ('China', 'Nigeria', 'France', 'Australia');
