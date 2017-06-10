-- https://sqlschool.modeanalytics.com/the-basics/logical-operators


/* Write a query that returns all rows for which Ludacris was a member of the group.

https://modeanalytics.com/tutorial/reports/67228a008c9d */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    artist ILIKE '%Ludacris%';


/* Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ"

https://modeanalytics.com/tutorial/reports/6cc7b85cc096 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    "group" ILIKE 'DJ%';


/* Write a query that shows all of the entries for Elvis and M.C. Hammer.
Hint: M.C. Hammer is actually on the list under multiple names,
so you may need to first write a query to figure out exactly how M.C. Hammer is listed.
You're likely to face similar problems that require some exploration in many real-life scenarios.

https://modeanalytics.com/tutorial/reports/b7c9462034d0 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    artist IN ('Elvis Presley', 'M.C. Hammer', 'Hammer');


/* Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.

https://modeanalytics.com/tutorial/reports/4ae007b7d3e3 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    year BETWEEN 1985 AND 1990;


/* Write a query that shows all of the rows for which song_name is null.

https://modeanalytics.com/tutorial/reports/c97c1d0b0fba */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    song_name IS NULL;


/* Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.

https://modeanalytics.com/tutorial/reports/e1731ac0419f */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    "group" ILIKE '%Ludacris%' AND
    year_rank <= 10;


/* Write a query that surfaces the top-ranked records in 1990, 2000, and 2010

https://modeanalytics.com/tutorial/reports/5f3ec7055dc0 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    year IN (1990, 2000, 2010) AND
    year_rank = 1;


/* Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi

https://modeanalytics.com/tutorial/reports/aa5a19da7f2e */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    ("group" ILIKE '%Katy Perry%' OR
     "group" ILIKE '%Bon Jovi%') AND
    year_rank <= 10;


/* Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.

https://modeanalytics.com/tutorial/reports/ca79c861050c */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    song_name ILIKE '%California%' AND
    ((year BETWEEN 1970 AND 1979) OR
     (year BETWEEN 1990 AND 1999));


/* Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a"

https://modeanalytics.com/tutorial/reports/f64867a56523 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    song_name NOT ILIKE '%a%' AND
    year = 2013;


/* Write a query that lists all top-100 recordings feature Dr. Dre before 2001 or after 2009.

https://modeanalytics.com/tutorial/reports/88c81c1a02e8 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    "group" ILIKE '%Dr. Dre%' AND
    (year < 2001 OR
     year > 2009);


/* Write a query that lists all songs from the 1960s with "love" in the title.

https://modeanalytics.com/tutorial/reports/11c78511873a */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    "song_name" ILIKE '%love%' AND
    (year BETWEEN 1960 AND 1969);
