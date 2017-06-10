-- https://sqlschool.modeanalytics.com/intermediate/case


/* Write a query that includes a column that is flagged "yes" when a player is from California,
and sort the results with those players first.

https://modeanalytics.com/tutorial/reports/88e5eb7c9b80 */

SELECT
    player_name,
    state,
    CASE
      WHEN state = 'CA' THEN 'yes'
      ELSE 'no'
      END
      AS from_cali
  FROM
    benn.college_football_players
  ORDER BY
    from_cali DESC;


/* Write a query that includes players' names and a column that classifies them into four categories based on height.
Keep in mind the answer is only one possible answer.

https://modeanalytics.com/tutorial/reports/3374045ecce5 */

SELECT
    player_name,
    height,
    CASE
      WHEN height < 70 THEN 'under 70'
      WHEN height BETWEEN 71 AND 72 THEN '71 - 72'
      WHEN height BETWEEN 73 AND 74 THEN '73 - 74'
      ELSE 'over 74'
      END
      AS height_class
  FROM
    benn.college_football_players;


/* Write a query that selects all columns from benn.college_football_players
and adds an additional column that displays the player's name if that player is a junior or senior.

https://modeanalytics.com/tutorial/reports/d7358e7734a2 */

SELECT
    *,
    CASE
      WHEN year IN ('JR', 'SR') THEN player_name
      END
      AS upperclass_player_name
  FROM
    benn.college_football_players;


/* Write a query that counts the number of 300lb+ players for each of the following regions:
West Coast (CA, OR, WA), Texas, and Other (Everywhere else).

https://modeanalytics.com/tutorial/reports/7f631173fabb */

SELECT
    CASE
      WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
      WHEN state = 'TX' THEN 'Texas'
      ELSE 'Other'
      END
      AS region,
    SUM(CAST(weight >= 300 AS INTEGER))
  FROM
    benn.college_football_players
  GROUP BY
    region
  ORDER BY
    region;


/* Write a query that calculates the combined weight of all underclass players (FR/SO)
in California as well as the combined weight of all upperclass players (JR/SR) in California.

https://modeanalytics.com/tutorial/reports/e86b592fe1e8 */

SELECT
    CASE
      WHEN year IN ('FR', 'SO') THEN 'underclass'
      WHEN year IN ('JR', 'SR') THEN 'upperclass'
      END
      AS class,
    SUM(weight)
  FROM
    benn.college_football_players
  WHERE
    state = 'CA'
  GROUP BY
    class
  ORDER BY
    class DESC;


/* Write a query that displays the number of players in each state, with FR, SO, JR, and SR players
in separate columns and another column for the total number of players. Order results such that states
with the most players come first.

https://modeanalytics.com/tutorial/reports/15bc4804da7b */

SELECT
    state,
    SUM(
      CASE
        WHEN year = 'FR' THEN 1
        ELSE 0
        END)
      AS nb_fr_players,
    SUM(
      CASE
        WHEN year = 'SO' THEN 1
        ELSE 0
        END)
      AS nb_so_players,
    SUM(
      CASE
        WHEN year = 'JR' THEN 1
        ELSE 0
        END)
      AS nb_jr_players,
    SUM(
      CASE
        WHEN year = 'SR' THEN 1
        ELSE 0
        END)
      AS nb_sr_players,
    COUNT(player_name) AS nb_players
  FROM
    benn.college_football_players
  GROUP BY
    state
  ORDER BY
    nb_players DESC;


/* Write a query that shows the number of players at schools with names that start with A through M,
and the number at schools with names starting with N - Z.

https://modeanalytics.com/tutorial/reports/3e2d489edbef */

SELECT
    CASE
      WHEN school_name < 'N' THEN 'A - M'
      ELSE 'N - Z'
      END
      AS school_name_range,
    COUNT(player_name)
  FROM
    benn.college_football_players
  GROUP BY
    school_name_range
  ORDER BY
    school_name_range;
