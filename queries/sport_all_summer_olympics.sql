WITH summer AS (SELECT * from athlete_events where season LIKE 'Summer'),
games AS (SELECT count(distinct games) summer_games from summer),
sport AS (SELECT sport, count(distinct games) count from summer)
SELECT sport from sport
WHERE count=(SELECT summer_games from games)
