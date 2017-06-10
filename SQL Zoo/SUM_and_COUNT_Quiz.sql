-- http://sqlzoo.net/wiki/SUM_and_COUNT_Quiz


-- 1c
SELECT
    SUM(population)
  FROM
    bbc
  WHERE
    region = 'Europe';


-- 2a
SELECT
    COUNT(name)
  FROM
    bbc
  WHERE
    population < 150000;


-- 3c
-- all agg functions: AVG(), COUNT(), FIRST(), LAST(), MAX(), MIN(), SUM()


-- 4e
SELECT
    region,
    SUM(area)
  FROM
    bbc
  GROUP BY
    region
  HAVING
    SUM(area) > 15000000;


-- 5b
SELECT
    AVG(population)
  FROM
    bbc
  WHERE
    name IN ('Poland', 'Germany', 'Denmark');


-- 6e
SELECT
    region,
    SUM(population) / SUM(area) AS density
  FROM
    bbc
  GROUP BY
    region;


-- 7d
SELECT
    name,
    population / area AS density
  FROM
    bbc
  WHERE
    population = (
      SELECT
          MAX(population)
        FROM
          bbc);


-- 8d
SELECT
    region,
    SUM(area)
  FROM
    bbc
  GROUP BY
    region
  HAVING
    SUM(area)<= 20000000;
