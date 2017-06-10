-- http://www.sqlcourse2.com/joins.html


-- 1. Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid, firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table.

SELECT
    customers.customerid AS customerid,
    customers.firstname AS firstname,
    customers.lastname AS lastname,
    items_ordered.item AS item,
    items_ordered.price AS price
  FROM
    customers
      JOIN items_ordered ON customers.customerid = items_ordered.customerid;


-- 2. Repeat exercise #1, however display the results sorted by state in descending order.

SELECT
    customers.state AS state,
    customers.customerid AS customerid,
    customers.firstname AS firstname,
    customers.lastname AS lastname,
    items_ordered.item AS item,
    items_ordered.price AS price
  FROM
    customers
      JOIN items_ordered ON customers.customerid = items_ordered.customerid
  ORDER BY
    customers.state DESC;
