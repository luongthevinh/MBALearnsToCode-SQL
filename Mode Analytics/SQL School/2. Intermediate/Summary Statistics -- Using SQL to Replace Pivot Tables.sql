-- https://sqlschool.modeanalytics.com/intermediate/aggregation-functions


/* Write a query to count the number of non-null rows in the low column.

https://modeanalytics.com/tutorial/reports/ce67f767fd35 */

SELECT
    COUNT(low)
  FROM
    tutorial.aapl_historical_stock_price;


/* Write a query that determines counts of every single column. Which column has the most null values?

https://modeanalytics.com/tutorial/reports/4da53e30e228 */

SELECT
    COUNT(year) AS year,
    COUNT(month) AS month,
    COUNT(open) AS open,
    COUNT(high) AS high,
    COUNT(low) AS low,
    COUNT(close) AS close,
    COUNT(volume) AS volume
  FROM
    tutorial.aapl_historical_stock_price;


/* Write a query to calculate the average opening price
(hint: you will need to use both COUNT and SUM, as well as some simple arithmetic.).

https://modeanalytics.com/tutorial/reports/4106c16551ac */

SELECT
    SUM(open) / COUNT(open)
  FROM
    tutorial.aapl_historical_stock_price;



/* What was Apple's lowest stock price (at the time of this data collection)?

https://modeanalytics.com/tutorial/reports/f374f60f4e9c */

SELECT
    MIN(low)
  FROM
    tutorial.aapl_historical_stock_price;


/* What was the highest single-day increase in Apple''s share value?

https://modeanalytics.com/tutorial/reports/1ed0029e2c68 */

SELECT
    MAX(close - open)
  FROM
    tutorial.aapl_historical_stock_price;


/* Write a query that calculates the average daily trade volume for Apple stock.

https://modeanalytics.com/tutorial/reports/0328fbae6c07 */

SELECT
    AVG(volume)
  FROM
    tutorial.aapl_historical_stock_price;
