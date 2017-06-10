-- http://sqlzoo.net/wiki/BBC_QUIZ


-- 1e
SELECT
    name
  FROM
    world
  WHERE
    name LIKE 'U%';


-- 2d
SELECT
    population
  FROM
    world
  WHERE
    name = 'United Kingdom';


-- 3b
SELECT
    continent
  FROM
    world
  WHERE
    name = 'France';


-- 4d
SELECT
    name,
    population / 10
  FROM
    world
  WHERE
    population < 10000;


-- 5b
SELECT
    name,
    population
  FROM
    world
  WHERE
    continent IN ('Europe', 'Asia');


-- 6d
SELECT
    name
  FROM
    world
  WHERE
    name IN ('Cuba', 'Togo');


-- 7c
SELECT
    name
  FROM
    world
 WHERE
    continent = 'South America' AND
    population > 40000000;
