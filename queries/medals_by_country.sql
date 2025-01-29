with gold AS (SELECT noc, count(medal)gold_medal from athlete_events where lower(medal)='gold' group by noc),
silver AS (SELECT noc, count(medal)silver_medal from athlete_events where lower(medal)='silver' GROUP by noc),
bronze AS (SELECT noc, count(medal)bronze_medal from athlete_events where lower(medal)='bronze' group by noc),
noc_medals AS (SELECT * from gold LEFT JOIN (SELECT * from silver) using (noc) LEFT JOIN (SELECT * from bronze) using (noc))
SELECT region, sum(gold_medal) gold,sum( silver_medal)silver, sum(bronze_medal) bronze from noc_medals LEFT JOIN (SELECT * from noc_regions) using(noc)
group by region
ORDER BY region
