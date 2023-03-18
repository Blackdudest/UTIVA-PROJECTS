-- ADEOYE SAMSON DATA SCIENCE POSGRES ASSIGNMENT 2

-- Q1 How many countries have played in the world cup?


WITH
	worldcup_year AS (
	SELECT 
    'worldcup_2002' AS worldcup_year,
    team,
    points
  FROM fifa_2002
  UNION ALL
  SELECT 
    'worldcup_2006' AS worldcup_year,
    team,
    points
  FROM fifa_2006
  UNION ALL
  SELECT 
    'worldcup_2010' AS worldcup_year,
    team,
    points
  FROM fifa_2010
  UNION ALL
  SELECT 
    'worldcup_2014' AS worldcup_year,
    team,
    points
  FROM fifa_2014
  UNION ALL
  SELECT 
    'worldcup_2018' AS worldcup_year,
    team,
    points
  FROM fifa_2018
    )
	
SELECT 
	COUNT (DISTINCT team)
FROM worldcup_year;


-- Q2 Total Games played,win,loss,goalsfor,against?

WITH
    worldcup_year AS (
      SELECT 
        'worldcup_2002' AS worldcup_year,
        team,
        games_played,
        win,
        loss,
        goals_for,
        goals_against,
        points
      FROM fifa_2002
      UNION ALL
      SELECT 
        'worldcup_2006' AS worldcup_year,
        team,
        games_played,
        win,
        loss,
        goals_for,
        goals_against,
        points
      FROM fifa_2006
      UNION ALL
      SELECT 
        'worldcup_2010' AS worldcup_year,
        team,
        games_played,
        win,
        loss,
        goals_for,
        goals_against,
        points
      FROM fifa_2010
      UNION ALL
      SELECT 
        'worldcup_2014' AS worldcup_year,
        team,
        games_played,
        win,
        loss,
        goals_for,
        goals_against,
        points
      FROM fifa_2014
      UNION ALL
      SELECT 
        'worldcup_2018' AS worldcup_year,
        team,
        games_played,
        win,
        loss,
        goals_for,
        goals_against,
        points
      FROM fifa_2018
    )
	
SELECT 
	SUM (games_played) AS total_games_played,
	SUM (win) AS total_wins,
	SUM (loss) AS total_loss,
	SUM (goals_for) total_goals_scored,
	SUM (goals_against) total_goals_conceded
FROM worldcup_year;


-- Q3 The country with the Highest and Lowest Apperance In The Last Five Years

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	games_played
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	games_played
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	games_played
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	games_played
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	games_played
FROM fifa_2018
	)
	
SELECT 
    team,
    time_games_played
FROM (SELECT team,COUNT(games_played) AS time_games_played FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    time_games_played = (
        SELECT MAX(time_games_played)
        FROM (
            SELECT COUNT(games_played) AS time_games_played
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR time_games_played = (
        SELECT MIN(time_games_played)
        FROM (
            SELECT COUNT(games_played) AS time_games_played
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY time_games_played;


-- Q4 The Country with the highest and lowest games played

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	games_played
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	games_played
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	games_played
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	games_played
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	games_played
FROM fifa_2018
	)
	
SELECT 
    team,
    total_games_played
FROM (SELECT team,SUM(games_played) AS total_games_played FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_games_played = (
        SELECT MAX(total_games_played)
        FROM (
            SELECT SUM(games_played) AS total_games_played
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_games_played = (
        SELECT MIN(total_games_played)
        FROM (
            SELECT SUM(games_played) AS total_games_played
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_games_played;


-- Q5 The Country With The Highest And Lowest Games Won

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	win
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	win
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	win
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	win
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	win
FROM fifa_2018
	)
	
SELECT 
    team,
    total_win
FROM (SELECT team,SUM(win) AS total_win FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_win = (
        SELECT MAX(total_win)
        FROM (
            SELECT SUM(win) AS total_win
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_win = (
        SELECT MIN(total_win)
        FROM (
            SELECT SUM(win) AS total_win
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_win;


-- Q6 The Country with The Highest and Lowest Games Lost

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	loss
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	loss
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	loss
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	loss
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	loss
FROM fifa_2018
	)
	
SELECT 
    team,
    total_loss
FROM (SELECT team,SUM(loss) AS total_loss FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_loss = (
        SELECT MAX(total_loss)
        FROM (
            SELECT SUM(loss) AS total_loss
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_loss = (
        SELECT MIN(total_loss)
        FROM (
            SELECT SUM(loss) AS total_loss
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_loss;

-- Q7 The Country with the Highest and Lowest Goals for

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	goals_for
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	goals_for
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	goals_for
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	goals_for
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	goals_for
FROM fifa_2018
	)
	
SELECT 
    team,
    total_goals_for
FROM (SELECT team,SUM(goals_for) AS total_goals_for FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_goals_for = (
        SELECT MAX(total_goals_for)
        FROM (
            SELECT SUM(goals_for) AS total_goals_for
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_goals_for = (
        SELECT MIN(total_goals_for)
        FROM (
            SELECT SUM(goals_for) AS total_goals_for
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_goals_for;


-- Q8 The Country With the Highest and Lowest Goals Against

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	goals_against
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	goals_against
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	goals_against
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	goals_against
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	goals_against
FROM fifa_2018
	)
	
SELECT 
    team,
    total_goals_against
FROM (SELECT team,SUM(goals_against) AS total_goals_against FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_goals_against = (
        SELECT MAX(total_goals_against)
        FROM (
            SELECT SUM(goals_against) AS total_goals_against
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_goals_against = (
        SELECT MIN(total_goals_against)
        FROM (
            SELECT SUM(goals_against) AS total_goals_against
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_goals_against;

-- Q9 The Country With The Highest and Lowest Goal Difference

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	goal_difference
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	goal_difference
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	goal_difference
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	goal_difference
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	goal_difference
FROM fifa_2018
	)
	
SELECT 
    team,
    total_goal_difference
FROM (SELECT team,SUM(goal_difference) AS total_goal_difference FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_goal_difference = (
        SELECT MAX(total_goal_difference)
        FROM (
            SELECT SUM(goal_difference) AS total_goal_difference
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_goal_difference = (
        SELECT MIN(total_goal_difference)
        FROM (
            SELECT SUM(goal_difference) AS total_goal_difference
            FROM worldcup_year
            GROUP BY team
        ) AS t)
ORDER BY total_goal_difference;


-- Q10 The country with the highest and lowest points

WITH
	worldcup_year AS (
	SELECT 
	'worldcup_2002' AS worldcup_year,
	team,
	points
FROM fifa_2002
UNION ALL
SELECT 
	'worldcup_2006' AS worldcup_year,
	team,
	points
FROM fifa_2006
UNION ALL
SELECT 
	'worldcup_2010' AS worldcup_year,
	team,
	points
FROM fifa_2010
UNION ALL
SELECT 
	'worldcup_2014' AS worldcup_year,
	team,
	points
FROM fifa_2014
UNION ALL
SELECT 
	'worldcup_2018' AS worldcup_year,
	team,
	points
FROM fifa_2018
	)
	
SELECT 
    team,
    total_points
FROM (SELECT team,SUM(points) AS total_points FROM worldcup_year
    GROUP BY team) AS t
WHERE 
    total_points = (
        SELECT MAX(total_points)
        FROM (
            SELECT SUM(points) AS total_points
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
    OR total_points = (
        SELECT MIN(total_points)
        FROM (
            SELECT SUM(points) AS total_points
            FROM worldcup_year
            GROUP BY team
        ) AS t
    )
ORDER BY total_points;





