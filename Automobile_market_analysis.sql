CREATE DATABASE car_sales_analysis;

USE car_sales_analysis

CREATE TABLE cars (
Make VARCHAR(50),
Model VARCHAR(50),
Type VARCHAR(50),
Origin VARCHAR(50),
DriveTrain VARCHAR(50),
MSRP INT,
Invoice INT,
EngineSize FLOAT,
Cylinders INT,
Horsepower INT,
MPG_City INT,
MPG_Highway INT,
Weight INT,
Wheelbase INT,
Length INT
);

select * from cars

--Total Number of cars
select count(*) as total_sales
from cars

--Avg price of cars
select avg(MSRP) avg_price from cars

--MAX & MIN price of car
select min(MSRP) as min_price,max(MSRP) as max_price
from cars

select * from cars

--Number of cars of each brand
SELECT Make, COUNT(*) AS total_models
FROM cars
GROUP BY Make
ORDER BY total_models DESC;

--Top 5 most expensive cars
select make,Model,MSRP FROM CARS order by MSRP DESC LIMIT 5

--Number of cars by type
SELECT Type, COUNT(*) AS total
FROM cars
GROUP BY Type;

--Avg price by car type
select type,avg(msrp) from cars group by type 

--Top 10 cars with highest horsepower
select make,model,horsepower
from cars
order by horsepower desc
LIMIT 10

--Average horesepower by brand
select MAKE,avg(horsepower) as Avg_horsepower 
from cars 
group by MAKE

--Avg horsepower by cartype
SELECT Type, AVG(Horsepower) AS avg_horsepower
FROM cars
GROUP BY Type
ORDER BY avg_horsepower DESC;

--Fuel Efficiency Analysis

--Top 10 most fuel-efficient cars (highway MPG)
SELECT Make, Model, MPG_Highway
FROM cars
ORDER BY MPG_Highway DESC
LIMIT 10;

--Average fuel efficiency by car type
SELECT Type, AVG(MPG_City) AS avg_city_mpg
FROM cars
GROUP BY Type;

--Brands whose average price is above overall average
SELECT Make, AVG(MSRP) AS avg_price
FROM cars
GROUP BY Make
HAVING AVG(MSRP) >
       (SELECT AVG(MSRP) FROM cars);
       
--Shows cars with highest dealer profit margin
SELECT Make, Model, MSRP, Invoice,
       (MSRP - Invoice) AS dealer_profit
FROM cars
ORDER BY dealer_profit DESC
LIMIT 10;

--Best fuel efficient car in each type
SELECT *
FROM (
    SELECT Make, Model, Type, MPG_Highway,
           RANK() OVER (PARTITION BY Type ORDER BY MPG_Highway DESC) AS fuel_rank
    FROM cars
) fuel
WHERE fuel_rank = 1;

--Brands producing cars in the most categories
SELECT Make, COUNT(DISTINCT Type) AS categories
FROM cars
GROUP BY Make
ORDER BY categories DESC;

--Price Percentile ranking of cars
SELECT Make, Model, MSRP,
       PERCENT_RANK() OVER (ORDER BY MSRP) AS price_percentile
FROM cars;

--To find out outliers
SELECT Make, Model, MSRP
FROM cars
WHERE MSRP > (
    SELECT AVG(MSRP) + 2 * STDDEV(MSRP)
    FROM cars
)
ORDER BY MSRP DESC;



--Identifies premium car brands.
WITH brand_price AS (
    SELECT Make, AVG(MSRP) AS avg_price
    FROM cars
    GROUP BY Make
)
SELECT *
FROM brand_price
WHERE avg_price > (
    SELECT AVG(avg_price) FROM brand_price
);


--Cars giving the best performance per price
SELECT Make, Model,
       MSRP / Horsepower AS price_per_hp
FROM cars
ORDER BY price_per_hp;

-- Cars balancing performance and fuel efficiency
SELECT Make, Model,
       Horsepower * MPG_Highway AS performance_score
FROM cars
ORDER BY performance_score DESC
LIMIT 10;


-- Market share of each brand
SELECT Make,
       COUNT(*) AS total_cars,
       ROUND(COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM cars),2) AS market_share_percentage
FROM cars
GROUP BY Make
ORDER BY market_share_percentage DESC;