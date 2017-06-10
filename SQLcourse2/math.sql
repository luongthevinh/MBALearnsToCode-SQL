-- http://www.sqlcourse2.com/math.html


-- 1. Select the item and per unit price for each item in the items_ordered table. Hint: Divide the price by the quantity.

SELECT
   price / quantity AS unit_price
 FROM
   items_ordered;
