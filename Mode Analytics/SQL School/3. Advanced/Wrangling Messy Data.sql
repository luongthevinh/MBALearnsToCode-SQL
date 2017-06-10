-- https://sqlschool.modeanalytics.com/advanced/data-cleaning


/* Write a query that separates the location field into separate fields for latitude and longitude.
You can compare your results against the actual lat and lon fields in the table.

https://modeanalytics.com/tutorial/reports/78d533ed005c */

SELECT
    LEFT(TRIM(BOTH '()' FROM location), POSITION(',' IN location) - 2) AS latitude,
    lat,
    RIGHT(TRIM(BOTH '()' FROM location), LENGTH(location) - STRPOS(location, ',') - 2) AS longitude,
    lon
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Concate the lat and lon fields to form a field that is identical to the location field.

https://modeanalytics.com/tutorial/reports/3b594976c097 */

SELECT
    CONCAT('(',lat, ', ', lon, ')') AS loc,
    location
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Create the same concatenated location field, but using the || syntax instead of CONCAT.

https://modeanalytics.com/tutorial/reports/1dc767c9846d */

SELECT
    '(' || lat || ', ' || lon || ')' AS loc,
    location
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Write a query that creates a date column formatted YYYY-MM-DD.

https://modeanalytics.com/tutorial/reports/c0d258cf7b6a */

SELECT
    CONCAT(SUBSTR(date, 7, 4), '-', LEFT(date, 2), '-', SUBSTR(date, 4, 2)) AS date_cleaned,
    date
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Write a query that returns the category field,
but with the first letter capitalized and the rest of the letters in lower-case.

https://modeanalytics.com/tutorial/reports/c96ee5c6516d */

SELECT
    LEFT(category, 1) || LOWER(RIGHT(category, LENGTH(category) - 1)) AS category
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Write a query that creates an accurate timestamp using the date and time columns in
 tutorial.sf_crime_incidents_2014_01.
 Include a field that is exactly 1 week later as well.

https://modeanalytics.com/tutorial/reports/4c908f47868a */

SELECT
    CONCAT(SUBSTR(date, 7, 4), '-', LEFT(date, 2), '-', SUBSTR(date, 4, 2), ' ', time, ':00 US/Pacific')::TIMESTAMP
      AS timestamp,
    CONCAT(SUBSTR(date, 7, 4), '-', LEFT(date, 2), '-', SUBSTR(date, 4, 2), ' ', time, ':00 US/Pacific')::TIMESTAMP +
      INTERVAL '1 week' AS timestamp_plus_1_week,
    date,
    time
  FROM
    tutorial.sf_crime_incidents_2014_01;


/* Write a query that counts the number of incidents reported by week.
Cast the week as a date to get rid of the hours/minutes/seconds.

https://modeanalytics.com/tutorial/reports/0315a8aa1e4c */

SELECT
    DATE_TRUNC('week',
      CONCAT(SUBSTR(date, 7, 4), '-', LEFT(date, 2), '-', SUBSTR(date, 4, 2), ' ', time, ':00 US/Pacific')::TIMESTAMP)::DATE
      AS week_starting,
    COUNT(*) AS nb_indidents
  FROM
    tutorial.sf_crime_incidents_2014_01
  GROUP BY
    week_starting
  ORDER BY
    week_starting;


/* Write a query that shows exactly how long ago each indicent was reported.
Assume that the dataset is in Pacific Standard Time (UTC - 8).

https://modeanalytics.com/tutorial/reports/ebc77b3a1dd7 */

SELECT
     NOW() -
       CONCAT(SUBSTR(date, 7, 4), '-', LEFT(date, 2), '-', SUBSTR(date, 4, 2), ' ', time, ':00 US/Pacific')::TIMESTAMP
       AS how_long_ago
   FROM
     tutorial.sf_crime_incidents_2014_01;
