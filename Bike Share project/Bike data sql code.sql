CREATE DATABASE bike_data;
USE bike_data;
SELECT * FROM bike_share_yr_0;
SELECT * FROM bike_share_yr_1;
SELECT * FROM cost_table;
WITH CTE AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)

SELECT dteday, season, a.yr, `weekday`, hr, rider_type, riders, price, COGS, 
ROUND(riders*price, 2) AS revenue, ROUND(riders*price - COGS*riders, 2) AS profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr

