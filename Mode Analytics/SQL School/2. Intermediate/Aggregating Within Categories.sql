-- https://sqlschool.modeanalytics.com/intermediate/grouped-aggregations


/* Calculate the total number shares traded each month. Order your results chronologically.

https://modeanalytics.com/tutorial/reports/36b338ee7ec5 */

SELECT
    year,
    month,
    SUM(volume)
  FROM
    tutorial.aapl_historical_stock_price
  GROUP BY
    year,
    month
  ORDER BY
    year,
    month;


/* Write a query to calculate the average daily price change in Apple stock, grouped by year

https://modeanalytics.com/tutorial/reports/c1881e6c354d */

SELECT
    year,
    AVG(close - open)
  FROM
    tutorial.aapl_historical_stock_price
  GROUP BY
    year
  ORDER BY
    year;


/* Write a query that calculates the lowest and highest prices that Apple stock achieved each month.

https://modeanalytics.com/tutorial/reports/9d9f9dcd83bb */

SELECT
    year,
    month,
    MIN(low) AS month_low,
    MAX(high) AS month_high
  FROM
    tutorial.aapl_historical_stock_price
  GROUP BY
    year,
    month
  ORDER BY
    year,
    month;