-- http://www.sqlcourse2.com/setoper.html


-- 1. Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.

SELECT
    date,
    item,
    price
  FROM
    items_ordered
  WHERE
    price BETWEEN 10 AND 80;


-- 2. Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.

SELECT
    firstname,
    city,
    state
  FROM
    customers
  WHERE
    state IN ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');
