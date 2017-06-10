-- http://sqlzoo.net/wiki/JOIN_Quiz


-- 1d


-- 2c


-- 3a
SELECT
    player,
    teamid,
    COUNT(*)
  FROM
    game
      JOIN goal ON matchid = id
  WHERE
    (team1 = 'GRE' OR
     team2 = 'GRE') AND
    teamid != 'GRE'
  GROUP BY
    player,
    teamid;


-- 4a
SELECT
    teamid,
    mdate
  FROM
    goal
      JOIN game ON matchid = id
  WHERE
    mdate = '9 June 2012';


-- 5b
SELECT
    DISTINCT player,
    teamid
  FROM
    game
      JOIN goal ON matchid = id
  WHERE
    stadium = 'National Stadium, Warsaw' AND
    (team1 = 'POL' OR
     team2 = 'POL') AND
    teamid != 'POL';


-- 6c
SELECT
    DISTINCT player,
    teamid,
    gtime
  FROM
    game
      JOIN goal ON matchid = id
  WHERE
    stadium = 'Stadion Miejski (Wroclaw)' AND
    ((teamid = team2 AND
      team1 != 'ITA') OR
     (teamid = team1 AND
      team2 != 'ITA'));


-- 7b
SELECT
    teamname,
    COUNT(*)
  FROM
    eteam
      JOIN goal ON teamid = id
  GROUP BY
    teamname
  HAVING
    COUNT(*) < 3;
