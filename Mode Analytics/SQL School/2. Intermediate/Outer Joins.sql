-- https://sqlschool.modeanalytics.com/intermediate/outer-joins


/* Write a query that performs an Inner Join between the tutorial.crunchbase_acquisitions table
and the tutorial.crunchbase_companies table, but instead of listing individual rows,
count the number of non-null rows in each table.

https://modeanalytics.com/tutorial/reports/e6cde36b3e4a */

SELECT
    COUNT(companies.*) AS nb_companies,
    COUNT(acquisitions.*) AS nb_acquisitions
  FROM
    tutorial.crunchbase_companies companies
      JOIN tutorial.crunchbase_acquisitions acquisitions
        ON companies.permalink = acquisitions.company_permalink;


/* Modify the query above to be a LEFT JOIN. Note the difference in results.

https://modeanalytics.com/tutorial/reports/0653d8834126 */

SELECT
    COUNT(companies.*) AS nb_companies,
    COUNT(acquisitions.*) AS nb_acquisitions
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
        ON companies.permalink = acquisitions.company_permalink;


/* Count the number of unique companies (don''t double-count companies)
and unique *acquired* companies by state. Do not include results for which there is no state data,
and order by the number of acquired companies from highest to lowest.

https://modeanalytics.com/tutorial/reports/8805606278ee */

SELECT
    companies.state_code AS state_code,
    COUNT(DISTINCT companies.permalink) AS nb_unique_companies,
    COUNT(DISTINCT acquisitions.company_permalink) AS nb_unique_acquisitions
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
        ON companies.permalink = acquisitions.company_permalink
  WHERE
    state_code IS NOT NULL
  GROUP BY
    state_code
  ORDER BY
    nb_unique_acquisitions DESC;


/* Write a query that shows a company''s name, "status" (found in the Companies table),
and the number of unique investors in that company. Order by the number of investors from most to fewest.
Limit to only companies in the state of New York.

https://modeanalytics.com/tutorial/reports/1cf1d38ba1fc */

SELECT
    companies.name,
    COUNT(DISTINCT investments.investor_permalink) AS nb_investors
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_investments investments
        ON companies.permalink = investments.company_permalink
  WHERE
    state_code = 'NY'
  GROUP BY
    companies.permalink,
    companies.name
  ORDER BY
    nb_investors DESC;


/* Write a query that lists investors based on the number of companies in which they are invested.
Include a row for companies with no investor, and order from most companies to least.

https://modeanalytics.com/tutorial/reports/58d5744f474b */

SELECT
    CASE
      WHEN investments.investor_name IS NULL THEN 'No Investors'
      ELSE investments.investor_name
      END
      AS investor,
    COUNT(DISTINCT companies.permalink) AS nb_investees
  FROM
    tutorial.crunchbase_companies companies
      LEFT JOIN tutorial.crunchbase_investments investments
        ON companies.permalink = investments.company_permalink
  GROUP BY
    investor
  ORDER BY
    nb_investees DESC;
