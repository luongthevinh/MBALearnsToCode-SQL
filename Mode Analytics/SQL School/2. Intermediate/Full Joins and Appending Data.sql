-- https://sqlschool.modeanalytics.com/intermediate/full-join-union


/* Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN.
Count up the number of rows that are matched/unmatched as in the example above.

https://modeanalytics.com/tutorial/reports/524108a9e0b0 */

SELECT
    COUNT(
      CASE
        WHEN
          companies.permalink IS NOT NULL AND
          investments.investor_permalink IS NULL
          THEN 1
        ELSE NULL
        END)
      AS companies_only,
    COUNT(
      CASE
        WHEN
          companies.permalink IS NOT NULL AND
          investments.investor_permalink IS NOT NULL
          THEN 1
        ELSE NULL
        END)
      AS both_tables,
    COUNT(
      CASE
        WHEN
          companies.permalink IS NULL AND
          investments.investor_permalink IS NOT NULL
          THEN 1
        ELSE NULL
        END)
      AS investors_only
  FROM
    tutorial.crunchbase_companies companies
      FULL JOIN tutorial.crunchbase_investments_part1 investments
        ON companies.permalink = investments.company_permalink;


/* Write a query that appends the two crunchbase_investments datasets above (including duplicate values).
Filter the first dataset to only companies with names that start with the letter "T",
and filter the second to companies names starting with "M" (both not case-sensitive).
Only include the company_permalink, company_name, and investor_name columns.

https://modeanalytics.com/tutorial/reports/46ac1e3a5886 */

SELECT
    companies.permalink AS company_permalink,
    companies.name AS company_name,
    investments.investor_name AS investor_name
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_investments_part1 investments
        ON companies.permalink = investments.company_permalink
  WHERE
    companies.name ILIKE 'T%'

UNION ALL

SELECT
    companies.permalink AS company_permalink,
    companies.name AS company_name,
    investments.investor_name AS investor_name
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_investments_part2 investments
        ON companies.permalink = investments.company_permalink
  WHERE
    companies.name ILIKE 'M%';


/* Write a query that shows 3 columns. The first indicates which dataset (part 1 or 2) the data comes from,
the second shows company status, and the third is a count of the number of investors.
Hint: you will have to use the tutorial.crunchbase_companies table as well as the investments tables.

https://modeanalytics.com/tutorial/reports/e8ebd7cc9d23 */

SELECT
    investments.investment_db AS investment_db,
    companies.status AS company_status,
    COUNT(DISTINCT investments.investor_permalink) AS nb_investors
  FROM
    tutorial.crunchbase_companies companies
      JOIN (
        SELECT
            1 AS investment_db,
            *
          FROM
            tutorial.crunchbase_investments_part1

        UNION ALL

        SELECT
            2 AS investment_db,
            *
          FROM
            tutorial.crunchbase_investments_part2) investments
        ON companies.permalink = investments.company_permalink
  GROUP BY
    investment_db,
    company_status
  ORDER BY
    investment_db,
    company_status;
