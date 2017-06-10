-- https://sqlschool.modeanalytics.com/the-basics/select-from


/* Write a query to select all of the columns in tutorial.us_housing_units and
rename them so that their first letters are capitalized

https://modeanalytics.com/tutorial/reports/740ad94d2ef9 */

SELECT
    year AS "Year",
    month AS "Month",
    month_name AS "Month Name",
    west AS "West",
    midwest AS "Mid West",
    south AS "South",
    northeast AS "North East"
  FROM
    tutorial.us_housing_units;


/* Write a query that uses LIMIT manually (written into the query) to restrict the result set to only 15 rows

https://modeanalytics.com/tutorial/reports/62f423b84e97 */

SELECT
    *
  FROM
    tutorial.us_housing_units
  LIMIT
    15;
