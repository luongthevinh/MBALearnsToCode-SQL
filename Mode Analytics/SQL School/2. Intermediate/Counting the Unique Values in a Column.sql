-- https://sqlschool.modeanalytics.com/intermediate/distinct


/* Write a query that returns the unique values in the year column, in chronological order

https://modeanalytics.com/tutorial/reports/2dde870b5811 */

SELECT
    DISTINCT year
  FROM
    tutorial.aapl_historical_stock_price
  ORDER BY
    year;


/* Write a query that counts the number of unique values in the month column for each year.

https://modeanalytics.com/tutorial/reports/ad26c0db22c5 */

SELECT
    year,
    COUNT(DISTINCT month)
  FROM
    tutorial.aapl_historical_stock_price
  GROUP BY
    year
  ORDER BY
    year;


/* Write a query that separately counts the number of unique values in the month column
and the number of unique values in the year column.

https://modeanalytics.com/tutorial/reports/bb4e07760340 */

SELECT
    COUNT(DISTINCT year),
    COUNT(DISTINCT month)
  FROM
    tutorial.aapl_historical_stock_price;
