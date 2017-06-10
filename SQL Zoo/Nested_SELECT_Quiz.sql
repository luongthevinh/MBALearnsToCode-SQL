-- http://sqlzoo.net/wiki/Nested_SELECT_Quiz


-- 1c
SELECT
    region,
    name,
    population
  FROM
    bbc
  x
  WHERE
    population <= ALL(
      SELECT
          population
        FROM
          bbc
        y
        WHERE
          y.region = x.region AND
          population > 0);


-- 2b
SELECT
    name,
    region,
    population
  FROM
    bbc
  x
  WHERE
    50000 < ALL(
      SELECT
          population
        FROM
          bbc
        y
        WHERE
          x.region = y.region AND
          y.population > 0);


-- 3a
SELECT
    name,
    region
  FROM
    bbc
  x
  WHERE
    population < ALL(
      SELECT
          population / 3
        FROM
          bbc
        y
        WHERE
          y.region = x.region AND
          y.name != x.name);


-- 4d
SELECT
    name
  FROM
    bbc
  WHERE
    population > (
      SELECT
          population
        FROM
          bbc
        WHERE
          name = 'United Kingdom') AND
    region IN (
      SELECT
          region
        FROM
          bbc
        WHERE
          name = 'United Kingdom');


-- 5b
SELECT
    name
  FROM
    bbc
  WHERE
    gdp > ALL(
      SELECT
          MAX(gdp)
        FROM
          bbc
        WHERE
          region = 'Africa' AND
          gdp IS NOT NULL);


-- 6b
SELECT
    name
  FROM
    bbc
  WHERE
    population < (
      SELECT
          population
        FROM
          bbc
        WHERE
          name = 'Russia') AND
    population > (
      SELECT
          population
        FROM
          bbc
        WHERE
          name = 'Denmark');


-- 7b
SELECT
    name
  FROM
    bbc
  WHERE
    population > ALL(
      SELECT
          MAX(population)
        FROM
          bbc
        WHERE
          region = 'Europe') AND
    region = 'South Asia';
