-- http://sqlzoo.net/wiki/Using_Null_Quiz


-- 1e
SELECT
    teacher.name,
    dept.name
  FROM
    teacher
      LEFT OUTER JOIN dept ON teacher.dept > dept.id;


-- 2c
SELECT
    dept.name
  FROM
    teacher
      JOIN dept ON dept.id = teacher.dept
  WHERE
    teacher.name = 'Cutflower';


-- 3e
SELECT
    dept.name,
    COUNT(teacher.name)
  FROM
    teacher
      RIGHT JOIN dept ON dept.id = teacher.dept
  GROUP BY
    dept.name;


-- 4b
SELECT
    name,
    dept,
    COALESCE(dept, 0) AS result
  FROM teacher;


-- 5a
SELECT
    name,
    CASE
      WHEN phone = 2752
        THEN 'two'
      WHEN phone = 2753
        THEN 'three'
      WHEN phone = 2754
        THEN 'four'
      END
      AS digit
  FROM
    teacher;


-- 6a
SELECT
    name,
    CASE
      WHEN dept IN (1)
        THEN 'Computing'
      ELSE 'Other'
      END
  FROM
    teacher;
