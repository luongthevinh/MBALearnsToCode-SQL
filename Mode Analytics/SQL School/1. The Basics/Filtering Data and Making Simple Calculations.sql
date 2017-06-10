-- https://sqlschool.modeanalytics.com/the-basics/where-operators


/* Did the West Region ever produce more than 50,000 housing units in one month?
Remember, the units in the table are already in thousands.

https://modeanalytics.com/tutorial/reports/eb5326c39637 */

SELECT
    *
  FROM
    tutorial.us_housing_units
  WHERE
    west > 50;


/* Did the South Region ever produce 20,000 or fewer housing units in one month?

https://modeanalytics.com/tutorial/reports/00e816870a30 */

SELECT
    *
  FROM
    tutorial.us_housing_units
  WHERE
    south <= 20;


/* Write a query that only shows rows for which the month name is February.

https://modeanalytics.com/tutorial/reports/1b0ec94376a6 */

SELECT
    *
  FROM
    tutorial.us_housing_units
  WHERE
    month_name = 'February';


/* Write a query that only shows rows for which the month_name starts with the letter "M"
or an earlier letter in the alphabet.

https://modeanalytics.com/tutorial/reports/122ce812e03f */

SELECT
    *
  FROM
    tutorial.us_housing_units
  WHERE
    month_name < 'N';


/* Write a query that calculates the sum of all four regions in a separate column.

https://modeanalytics.com/tutorial/reports/b83cefc05943 */

SELECT
    *,
    west + midwest + south + northeast AS usa_total
  FROM
    tutorial.us_housing_units;


/* Write a query that returns all rows for which more units were produced in the West region
than in the Midwest and Northeast combined.

https://modeanalytics.com/tutorial/reports/bb17c0984edb */

SELECT
    *
  FROM
    tutorial.us_housing_units
  WHERE
    west > midwest + northeast;


/* Write a query that calculates the percentage of all houses completed in the United States represented by each region.
Only return results from the year 2000 and later. Hint: There should be four columns of percentages.

https://modeanalytics.com/tutorial/reports/bffb59fa65a0 */

SELECT
    year,
    month,
    100 * west / (west + south + midwest + northeast) AS west_pct,
    100 * south / (west + south + midwest + northeast) AS south_pct,
    100 * midwest / (west + south + midwest + northeast) AS midwest_pct,
    100 * northeast / (west + south + midwest + northeast) AS northeast_pct
  FROM
    tutorial.us_housing_units
  WHERE
    year >= 2000;
