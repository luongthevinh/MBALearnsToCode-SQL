-- http://sqlzoo.net/wiki/Self_join


/* 1. How many stops are in the database. */

SELECT
    COUNT(id)
  FROM
    stops;


/* 2. Find the id value for the stop 'Craiglockhart' */

SELECT
    id
  FROM
    stops
  WHERE
    name = 'Craiglockhart';


/* 3. Give the id and the name for the stops on the '4' 'LRT' service. */

SELECT
    stops.id,
    stops.name
  FROM
    stops
      JOIN route ON stops.id = route.stop
  WHERE
    route.num = 4 AND
    route.company = 'LRT';


/* 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
Run the query and notice the two services that link these stops have a count of 2.
Add a HAVING clause to restrict the output to these two routes. */

SELECT
    company,
    num,
    COUNT(*)
  FROM
    route
  WHERE
    stop=149 OR
    stop=53
  GROUP BY
    company,
    num
  HAVING
    COUNT(*) = 2;


/* 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart,
without changing routes. Change the query so that it shows the services from Craiglockhart to London Road. */

SELECT
    route.company,
    route.num,
    route.stop,
    route_1.stop
  FROM
    route
      JOIN route route_1
        ON route.company = route_1.company AND
           route.num = route_1.num
  WHERE
    route.stop = 53 AND
    route_1.stop = 149;


/* 6. The query shown is similar to the previous one, however by joining two copies of the stops table
we can refer to stops by name rather than by number.

Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. */

SELECT
    route.company,
    route.num,
    stops.name,
    stops_1.name
  FROM
    route
      JOIN route route_1
        ON route.company = route_1.company AND
           route.num = route_1.num
      JOIN stops
        ON route.stop = stops.id
      JOIN stops stops_1
        ON route_1.stop = stops_1.id
  WHERE
    stops.name = 'Craiglockhart' AND
    stops_1.name = 'London Road';


/* 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith') */

SELECT
    route.company,
    route.num
  FROM
    route
      JOIN route route_1
        ON route.company = route_1.company AND
           route.num = route_1.num
      JOIN stops
        ON route.stop = stops.id
      JOIN stops stops_1
        ON route_1.stop = stops_1.id
  WHERE
    stops.name = 'Haymarket' AND
    stops_1.name = 'Leith'
  GROUP BY
    route.company,
    route.num;


/* 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross' */

SELECT
    route.company,
    route.num
  FROM
    route
      JOIN route route_1
        ON route.company = route_1.company AND
           route.num = route_1.num
      JOIN stops
        ON route.stop = stops.id
      JOIN stops stops_1
        ON route_1.stop = stops_1.id
 WHERE
   stops.name = 'Craiglockhart' AND
   stops_1.name = 'Tollcross'
 GROUP BY
   route.company,
   route.num;


/* 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus,
including 'Craiglockhart' itself, offered by the LRT company.

Include the company and bus no. of the relevant services. */

SELECT
    stops_1.name,
    route_1.company,
    route_1.num
  FROM
    route
      JOIN route route_1
        ON route.company = route_1.company AND
           route.num = route_1.num
      JOIN stops
        ON route.stop = stops.id
      JOIN stops stops_1
        ON route_1.stop = stops_1.id
  WHERE
    route.company = 'LRT' AND
    stops.name = 'Craiglockhart';


/* 10. Find the routes involving two buses that can go from Craiglockhart to Sighthill.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus. */

SELECT
    route_1.nb AS route_1_nb,
    route_1.co AS route_1_co,
    route_1.end_stop AS transfer_stop_name,
    route_2.nb AS route_2_nb,
    route_2.co AS route_2_co
  FROM

    (SELECT
        route_1_start.num AS nb,
        route_1_start.company AS co,
        stops_1_end.name AS end_stop
      FROM
        route route_1_start
          JOIN route route_1_end
            ON route_1_start.company = route_1_end.company AND
               route_1_start.num = route_1_end.num
          JOIN stops stops_1_start
            ON route_1_start.stop = stops_1_start.id
          JOIN stops stops_1_end
            ON route_1_end.stop = stops_1_end.id
      WHERE
        stops_1_start.name = 'Craiglockhart') route_1

      JOIN

      (SELECT
          route_2_start.num AS nb,
          route_2_start.company AS co,
          stops_2_start.name AS start_stop
        FROM
          route route_2_start
            JOIN route route_2_end
              ON route_2_start.company = route_2_end.company AND
                 route_2_start.num = route_2_end.num
            JOIN stops stops_2_start
              ON route_2_start.stop = stops_2_start.id
            JOIN stops stops_2_end
              ON route_2_end.stop = stops_2_end.id
        WHERE
          stops_2_end.name = 'Sighthill') route_2

        ON route_1.end_stop = route_2.start_stop AND
           route_1.nb != route_2.nb;

-- SELECT distinct StartOfR1.num, StartOfR1.company, Xfer.name xfer_name,  EndOfR2.num, EndOfR2.company
-- FROM stops Start, stops Xfer, stops Finish, route StartOfR1, route EndOfR1, route StartOfR2, route EndOfR2
-- WHERE Start.name='Craiglockhart' AND Finish.name='Sighthill' AND StartOfR1.stop= Start.id -- R1 actually visits Start
-- AND EndOfR1.num = StartOfR1.num  -- no transfer on the same route
-- AND EndOfR1.stop= StartOfR2.stop   -- R2 starts where R1 ends
-- AND EndOfR1.num != StartOfR2.num -- R1 and R2 are not the same route
-- AND EndOfR1.stop = Xfer.id-- R1 changes to R2
-- AND EndOfR2.company = StartOfR2.company -- R1 changes bus to R2
-- AND EndOfR2.num = StartOfR2.num  -- two stops on the same route
-- AND EndOfR2.stop = Finish.id -- R2 actually visits Finish;
