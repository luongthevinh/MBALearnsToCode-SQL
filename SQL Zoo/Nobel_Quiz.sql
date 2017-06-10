-- http://sqlzoo.net/wiki/Nobel_Quiz


-- 1e
SELECT
    winner
  FROM
    nobel
  WHERE
    winner LIKE 'C%' AND
    winner LIKE '%n';


-- 2c
SELECT
    COUNT(subject)
  FROM
    nobel
  WHERE
    subject = 'Chemistry' AND
    yr BETWEEN 1950 AND 1960;


-- 3b
SELECT
    COUNT(DISTINCT yr)
  FROM
    nobel
  WHERE
    yr NOT IN (
      SELECT
          DISTINCT yr
        FROM
          nobel
        WHERE
          subject = 'Medicine');


-- 4c
SELECT
    subject,
    winner
  FROM
    nobel
  WHERE
    winner LIKE 'Sir%' AND
    yr LIKE '196%';


-- 5c
SELECT
    yr
  FROM
    nobel
  WHERE
    yr NOT IN (
      SELECT
          yr
        FROM
          nobel
        WHERE
          subject IN ('Chemistry','Physics'));


-- 6c
SELECT
    DISTINCT yr
  FROM
    nobel
  WHERE
    subject='Medicine' AND
    yr NOT IN (
      SELECT
          yr
        FROM
          nobel
        WHERE
          subject='Literature') AND
    yr NOT IN (
      SELECT
          yr
        FROM
          nobel
        WHERE
          subject='Peace');


-- 7d
SELECT
    subject,
    COUNT(subject)
  FROM
    nobel
  WHERE
    yr = '1960'
  GROUP BY
    subject;
