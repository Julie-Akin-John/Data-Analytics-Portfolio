CREATE DATABASE pizza_db;

SELECT * FROM pizza_sales;

-- a.	Total revenue --
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- b.	Average Order Value --
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- c.	Total Pizza sold --
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- d.	Total Orders Placed --
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- e.	Average Pizza Per Order  --
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id), 2) AS Avg_Pizzas_Per_Order FROM pizza_sales;

-- CHART REQUIREMENTS --
-- a.	 Total Sales and Percentage Sales per Pizza Category --
SELECT pizza_category,
	ROUND(SUM(total_price), 2) AS Total_Sales,
    ROUND(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_category;

-- b.	Total Sales and Percentage Sales Per Pizza Size --
SELECT pizza_size,
	ROUND(SUM(total_price), 2) AS Total_Sales,
    ROUND(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_Sales DESC;

-- c.	Top 5 Best Pizzas by Revenue --
SELECT pizza_name, 
       SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- d.	Bottom 5 Pizzas by Revenue --
SELECT pizza_name, 
       ROUND(SUM(total_price), 2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- e.	Top 5 Pizzas by Quantity --
SELECT pizza_name, 
       SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- f.	Bottom 5 Pizzas   Per Quantity --
SELECT pizza_name, 
       SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;

-- g.	Top 5 Pizzas Per Order--
SELECT pizza_name, 
       COUNT(DISTINCT  order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- h.	Bottom 5 pizzas Per Order --
SELECT pizza_name, 
       COUNT(DISTINCT  order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;

