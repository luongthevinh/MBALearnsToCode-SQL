-- https://sqlschool.modeanalytics.com/the-basics/order-by


/* Write a query that returns all rows from 2012, ordered by song title from Z to A.

https://modeanalytics.com/tutorial/reports/bb73b574f95a */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    year = 2012
  ORDER BY
    song_name DESC;


/* Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.

https://modeanalytics.com/tutorial/reports/1e40d45ef12f */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    year = 2010
  ORDER BY
    year_rank,
    artist;


/* Write a query that shows all rows for which T-Pain was a group member,
ordered by rank on the charts, from lowest to highest rank (from 100 to 1).

https://modeanalytics.com/tutorial/reports/e162590d4dd9 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    "group" ILIKE '%T-Pain%'
  ORDER BY
    year_rank DESC;


/* Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013.
Order the results by year and rank, and leave a comment on each line of
the WHERE clause to indicate what that line does

https://modeanalytics.com/tutorial/reports/34a457c9e468 */

SELECT
    *
  FROM
    tutorial.billboard_top_100_year_end
  WHERE
    year_rank BETWEEN 10 AND 20 AND
    year in (1993, 2003, 2013)
  ORDER BY
    year,
    year_rank;
