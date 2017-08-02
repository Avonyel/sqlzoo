----------------------------
--		SEQUEL Basics 			--
----------------------------

SELECT population FROM world
  WHERE name = 'Germany'

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

----------------------------
--		Select from World 	--
----------------------------

SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population >= 200000000

SELECT name, gdp / population AS "per capita GDP"
FROM world
WHERE population >= 200000000

SELECT name, population / 1000000 AS "population"
FROM world
WHERE continent = 'South America'

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

SELECT name
FROM world
WHERE name LIKE '%United%'

SELECT name, population, area
FROM world
WHERE population > 250000000
OR area > 3000000

SELECT name, population, area
FROM world
WHERE population > 250000000
XOR area > 3000000

SELECT name, ROUND(population / 1000000, 2), ROUND(gdp /1000000000, 2)
FROM world
WHERE continent = 'South America'

SELECT name, ROUND(gdp / population, -3)
FROM world
WHERE gdp >= 1000000000000

SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital
FROM world
WHERE name <> capital
AND LEFT(name, 1) = LEFT(capital, 1)

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'

----------------------------
--		Select from Nobel 	--
----------------------------

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989
AND subject = 'Literature'

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%';

SELECT *
  FROM nobel
  WHERE (yr = 1980 AND subject = 'Physics')
    OR (yr = 1984 AND subject = 'Chemistry');

SELECT *
  FROM nobel
  WHERE yr = 1980
    AND subject NOT IN ('Chemistry', 'Medicine');

SELECT *
  FROM nobel
  WHERE (yr < 1910 AND subject = 'Medicine')
    OR (yr > 2003 AND subject = 'Literature');

SELECT *
  FROM nobel
  WHERE winner
	LIKE 'PETER GR_NBERG';

SELECT *
  FROM nobel
  WHERE winner = 'EUGENE O\'NEILL';

SELECT winner, yr, subject
  FROM nobel
  WHERE winner
    LIKE 'Sir%'
  ORDER BY yr DESC, winner;

SELECT winner, subject
	  FROM nobel
	 WHERE yr=1984
	 ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner;

----------------------------
--		Select from JOIN 	--
----------------------------

SELECT matchid, player
 FROM goal
 JOIN eteam ON eteam.id = goal.teamid
 where teamid = 'GER';

SELECT id,stadium,team1,team2
 FROM game
 WHERE id = 1012;

SELECT player, teamid, stadium, mdate
 FROM game JOIN goal ON (id=matchid)
 WHERE teamid = 'GER';
