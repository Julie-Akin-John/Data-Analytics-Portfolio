 -- First create database and set to use
CREATE DATABASE bike_data;
USE bike_data;
-- Import the tables by right-clicking the database name on the schema panel and selecting Table Data Import Wizard
-- View the table 
SELECT * FROM bike_share_yr_0;
-- To combine all the tables we imported we'll use the JOIN function
-- First look through all the tables to notice the similarity. We see that the difference majorly is the year so we want to stack the tables i.e. apeend using UNION. 
-- To keep it clean and organized we'll name the newly formed table CTE
-- UNION removes duplicates, UNION ALL bring everything

WITH CTE AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)

SELECT * FROM CTE;

-- Then we connect the CTE table (a) to cost table (b) using a left join
/* SELECT * 
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr */
-- This adds the yr and cost of goods (COGS) from the cost table b to the CTE table a

-- To select columns we actually need just replace * with column names. yr would be ambiguous because there are two columns, so identify with the alias of the CTE table
/* SELECT dteday, season, a.yr, `weekday`, hr, rider_type, riders, price, COGS 
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr */
-- To add calculated columns, just add to the listed columns already available
SELECT dteday, season, a.yr, `weekday`, hr, rider_type, riders, price, COGS, 
ROUND(riders*price, 2) AS revenue, ROUND(riders*price - COGS*riders, 2) AS profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr

-- Export the table and load to PowerBI
-- the final code is:
/* WITH CTE AS (
SELECT * FROM bike_share_yr_0
UNION
SELECT * FROM bike_share_yr_1)

SELECT dteday, season, a.yr, `weekday`, hr, rider_type, riders, price, COGS, 
ROUND(riders*price, 2) AS revenue, ROUND(riders*price - COGS*riders, 2) AS profit
FROM CTE a
LEFT JOIN cost_table b
ON a.yr = b.yr */