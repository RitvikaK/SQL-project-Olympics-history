WITH nation AS (SELECT * from athlete_events LEFT JOIN (SELECT * from noc_regions) using (noc)),
country_counts AS (SELECT region, count (distinct games)count  from nation
GROUP BY region
—ORDER BY count desc),
total_games AS (SELECT count(distinct games) games_count from athlete_events)
SELECT region from country_counts WHERE count IN (SELECT games_count from total_games)
