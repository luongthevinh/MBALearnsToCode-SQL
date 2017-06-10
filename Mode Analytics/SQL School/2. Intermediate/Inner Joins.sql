-- https://sqlschool.modeanalytics.com/intermediate/inner-joins


/* Write a query that selects the school name, player name, position, and weight for every player in Georgia,
ordered by weight (heaviest to lightest).
Be sure to make an alias for the table, and to reference all column names in relation to the alias.

https://modeanalytics.com/tutorial/reports/b4bc413f9399 */

SELECT
    players.school_name,
    players.player_name,
    players.position,
    players.weight
  FROM
    benn.college_football_players players
  WHERE
    players.state = 'GA'
  ORDER BY
    players.weight DESC;


/* Write a query that displays player names,
school names and conferences for schools in the "FBS (Division I-A Teams)" division.

https://modeanalytics.com/tutorial/reports/16915859fe4c */

SELECT
    players.player_name,
    players.school_name,
    teams.conference
  FROM
    benn.college_football_players players
      JOIN benn.college_football_teams teams
        ON players.school_name = teams.school_name
  WHERE
    teams.division = 'FBS (Division I-A Teams)';
