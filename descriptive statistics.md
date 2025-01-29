## Olympic Games Statistics

### General Statistics
| Statistic Name                                  | Result | SQL Query |
|------------------------------------------------|--------|-----------|
| Total Number of Athletes                        |        | `SELECT count(distinct name) FROM athlete_events;` |
| Number of Summer and Winter Games               |        | `SELECT count(distinct year), season FROM athlete_events GROUP BY season;` |
| Total Years There Was a Game (With Season)     |        | `SELECT distinct year, season FROM athlete_events ORDER BY year;` |

### Location-Based Statistics
| Statistic Name                                  | Result | SQL Query |
|------------------------------------------------|--------|-----------|
| City Each Game Was Hosted In                   |        | `SELECT distinct year, city, Games FROM athlete_events ORDER BY year;` |
| Every City That Has Ever Hosted a Game         |        | `SELECT distinct city FROM athlete_events;` |

### Participation Statistics
| Statistic Name                                  | Result | SQL Query |
|------------------------------------------------|--------|-----------|
| All Teams That Have Participated               |        | `SELECT DISTINCT team FROM athlete_events;` |
| Total Athletes Per NOC                         |        | `SELECT DISTINCT noc, region, count(distinct name) AS number_athletes FROM athlete_events LEFT JOIN (SELECT * FROM noc_regions) USING (noc) GROUP BY noc, region ORDER BY number_athletes DESC;` |
| Total Athletes Per Region                      |        | `SELECT DISTINCT region, count(distinct name) AS number_athletes FROM athlete_events LEFT JOIN (SELECT * FROM noc_regions) USING (noc) GROUP BY region ORDER BY number_athletes DESC;` |
| Total Athletes Per Region By Sex               |        | `SELECT DISTINCT region, sex, count(distinct name) AS number_athletes FROM athlete_events LEFT JOIN (SELECT * FROM noc_regions) USING (noc) GROUP BY sex, region ORDER BY region;` |

### Athlete Demographics
| Statistic Name                                  | Result | SQL Query |
|------------------------------------------------|--------|-----------|
| Youngest and Oldest Athletes                   |        | `SELECT MIN(Age), MAX(Age) FROM athlete_events WHERE age NOT LIKE 'NA';` |

### Sport-Specific Statistics
| Statistic Name                                  | Result | SQL Query |
|------------------------------------------------|--------|-----------|
| Number of Athletes Per Sport by First Year Occurred |  | `SELECT DISTINCT sport, count(distinct name) AS athlete_numbers, MIN(year) AS commencement_year FROM athlete_events GROUP BY sport ORDER BY sport;` |
