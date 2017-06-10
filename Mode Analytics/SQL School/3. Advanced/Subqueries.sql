-- https://sqlschool.modeanalytics.com/advanced/subqueries


/* Write a query that selects all Warrant Arrests from the tutorial.sf_crime_incidents_2014_01 dataset,
then wrap it in an outer query that filters out unresolved incidents.

https://modeanalytics.com/tutorial/reports/3af88ef4ee7a */

SELECT subq.*
  FROM (
    SELECT
        *
      FROM
        tutorial.sf_crime_incidents_2014_01
      WHERE
        descript = 'WARRANT ARREST') subq
  WHERE
    subq.resolution = 'NONE';


/* Write a query that displays the average number of incidents per month, by category.
Hint: use tutorial.sf_crime_incidents_cleandate to make your life a little easier.

https://modeanalytics.com/tutorial/reports/7a6b1f866394 */

SELECT
    subq.category,
    AVG(subq.nb_incidents) AS avg_nb_incidents
  FROM (
    SELECT
        EXTRACT('year' FROM cleaned_date) AS year,
        EXTRACT('month' FROM cleaned_date) AS month,
        category,
        COUNT(*) AS nb_incidents
      FROM
        tutorial.sf_crime_incidents_cleandate
      GROUP BY
        year,
        month,
        category) subq
  GROUP BY
    subq.category;


/* Write a query that displays all rows from the three categories with the fewest incidents reported.

https://modeanalytics.com/tutorial/reports/1a6ee6229859 */

SELECT
    *
  FROM
    tutorial.sf_crime_incidents_2014_01
  WHERE
    category IN (
      SELECT
          category
        FROM
          tutorial.sf_crime_incidents_2014_01
        GROUP BY
          category
        ORDER BY
          COUNT(*)
        LIMIT
          3);


/* Write a query that counts the number of companies founded and acquired by quarter starting in Q1 2012.
Create the aggregations in two separate queries, then join them.

https://modeanalytics.com/tutorial/reports/6ebd90cda35c */

SELECT
    subq_companies.founded_quarter AS quarter,
    subq_companies.nb_founded AS nb_founded,
    subq_acquisitions.nb_acquired AS nb_acquired
  FROM
    (SELECT
        founded_quarter,
        COUNT(*) AS nb_founded
      FROM
        tutorial.crunchbase_companies
      WHERE
        founded_quarter >= '2012-Q1'
      GROUP BY
        founded_quarter) subq_companies

      JOIN

        (SELECT
            acquired_quarter,
            COUNT(DISTINCT company_permalink) AS nb_acquired
          FROM
            tutorial.crunchbase_acquisitions
          WHERE
            acquired_quarter >= '2012-Q1'
          GROUP BY
            acquired_quarter) subq_acquisitions

        ON subq_companies.founded_quarter = subq_acquisitions.acquired_quarter
  ORDER BY
    quarter;


/* Write a query that ranks investors from the combined dataset above
by the total number of investments they have made.

https://modeanalytics.com/tutorial/reports/740b0e583576 */

SELECT
    subq.investor_name,
    COUNT(*) AS nb_investments
  FROM (
    SELECT
        *
      FROM
        tutorial.crunchbase_investments_part1

    UNION ALL

    SELECT
        *
      FROM
        tutorial.crunchbase_investments_part2) subq
  GROUP BY
    subq.investor_name
  ORDER BY
    nb_investments DESC;


/* Write a query that does the same thing as in the previous problem,
except only for companies that are still operating.
Hint: operating status is in tutorial.crunchbase_companies.

https://modeanalytics.com/tutorial/reports/019819a0608d */

SELECT
    subq_investments.investor_name,
    COUNT(subq_investments.company_permalink) AS nb_investments_in_operating_companies
  FROM
    (SELECT
        *
      FROM
        tutorial.crunchbase_companies
      WHERE
        status = 'operating') subq_companies

      JOIN

        (SELECT
            *
          FROM
            tutorial.crunchbase_investments_part1

        UNION ALL

        SELECT
            *
          FROM
            tutorial.crunchbase_investments_part2) subq_investments

        ON subq_companies.permalink = subq_investments.company_permalink
  GROUP BY
    subq_investments.investor_name
  ORDER BY
    nb_investments_in_operating_companies DESC;
