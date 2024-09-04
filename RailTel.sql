--1.Calculate the Daily Price Range:--
SELECT trade_date,
       high_price,
       low_price,
       (high_price - low_price) AS price_range
FROM RailTel_Share_Prices;

--2.Identify the Days with the Highest and Lowest Trading Volumes--
--Day with the highest trading volume--
SELECT trade_date, volume_traded
FROM RailTel_Share_Prices
ORDER BY volume_traded DESC
LIMIT 1;

-- Day with the lowest trading volume

SELECT trade_date, volume_traded
FROM RailTel_Share_Prices
ORDER BY volume_traded ASC
LIMIT 1;

--3.Determine the Average Closing Price:--

SELECT AVG(close_price) AS average_closing_price
FROM RailTel_Share_Prices;

--4Count the Number of Trading Days--

SELECT COUNT(trade_date) AS number_of_trading_days
FROM RailTel_Share_Prices;

--5.Calculate Cumulative Trading Volume by Month--
--This query calculates the cumulative trading volume for each month, which helps in understanding the trading activity over time--
SELECT YEAR(trade_date) AS year,
       MONTH(trade_date) AS month,
       SUM(volume_traded) OVER (PARTITION BY YEAR(trade_date), MONTH(trade_date) ORDER BY trade_date) AS cumulative_volume
FROM RailTel_Share_Prices;

--6. Identify the Top 5 Days with the Largest Price Fluctuations--
--This query identifies the top 5 days with the largest difference between the highest and lowest prices--
SELECT trade_date,
       high_price,
       low_price,
       (high_price - low_price) AS price_fluctuation
FROM RailTel_Share_Prices
ORDER BY price_fluctuation DESC
LIMIT 5;


