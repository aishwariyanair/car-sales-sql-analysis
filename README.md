# Automobile Market Analysis

## 📊 **Project Overview**
This project performs exploratory data analysis on a car dataset using SQL to understand pricing trends, brand performance, fuel efficiency, and vehicle specifications.
The goal is to extract meaningful insights that could help automobile companies, dealerships, and analysts understand market patterns and product positioning.


## 📈 **Dataset Overview**

The dataset contains information about various car models including:

Make – Brand of the car

Model – Car model name

Type – Vehicle category (SUV, Sedan, Sports, etc.)

Origin – Country/region of manufacturer

DriveTrain – Type of drivetrain (FWD, RWD, AWD)

MSRP – Manufacturer’s Suggested Retail Price

Invoice – Price paid by dealer to manufacturer

EngineSize – Engine displacement

Cylinders – Number of engine cylinders

Horsepower – Engine power output

MPG_City – Fuel efficiency in city driving

MPG_Highway – Fuel efficiency on highways

## 📊 SQL Analysis Queries

## 📝 **SQL Queries Answered**

The following SQL queries were executed to answer specific business questions:

### 1. 🛠️ Table Creation Script
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

### 2.  What is the total number of cars
```sql
select count(*) as total_sales
from cars
```

### 3.  What is the average cost of cars
```sql
select avg(MSRP) avg_price from cars
```

### 3.  What is the minimum & maximum cost of cars
```sql
select min(MSRP) as min_price,max(MSRP) as max_price
from cars
```

### 4.  Number of Cars per brand
```sql
SELECT Make, COUNT(*) AS total_models
FROM cars
GROUP BY Make
ORDER BY total_models DESC;
```

### 5.  Top 5 most expensive cars
```sql
select make,Model,MSRP FROM CARS order by MSRP DESC LIMIT 5
```

### 6.  Number of cars per type
```sql
SELECT Type, COUNT(*) AS total
FROM cars
GROUP BY Type;
```

### 7.  Avg price by car type
```sql
select type,avg(msrp) from cars group by type
```

### 8.  Top 10 cars with highest horsepower
```sql
select make,model,horsepower
from cars
order by horsepower desc
LIMIT 10
```

### 9.  Average horsepower by brand
```sql
select MAKE,avg(horsepower) as Avg_horsepower 
from cars 
group by MAKE
```

### 10.  Top 10 most fuel-efficient cars (highway MPG)
```sql
SELECT Make, Model, MPG_Highway
FROM cars
ORDER BY MPG_Highway DESC
LIMIT 10;
```

### 11.  Average fuel efficiency by car type
```sql
SELECT Type, AVG(MPG_City) AS avg_city_mpg
FROM cars
GROUP BY Type;
```

### 12.  Brands whose average price is above overall average
```sql
SELECT Make, AVG(MSRP) AS avg_price
FROM cars
GROUP BY Make
HAVING AVG(MSRP) >
       (SELECT AVG(MSRP) FROM cars);
```
       

### 13.  Shows cars with highest dealer profit margin
```sql
SELECT Make, Model, MSRP, Invoice,
       (MSRP - Invoice) AS dealer_profit
FROM cars
ORDER BY dealer_profit DESC
LIMIT 10;
```

### 14.  Best fuel efficient car in each type
```sql
SELECT *
FROM (
    SELECT Make, Model, Type, MPG_Highway,
           RANK() OVER (PARTITION BY Type ORDER BY MPG_Highway DESC) AS fuel_rank
    FROM cars
) fuel
WHERE fuel_rank = 1;
```

### 15.  Brands producing cars in the most categories
```sql
SELECT Make, COUNT(DISTINCT Type) AS categories
FROM cars
GROUP BY Make
ORDER BY categories DESC;
```

### 16.  Price Percentile ranking of cars
```
SELECT Make, Model, MSRP,
       PERCENT_RANK() OVER (ORDER BY MSRP) AS price_percentile
FROM cars;
```

### 17.  To find out outliers
```sql
SELECT Make, Model, MSRP
FROM cars
WHERE MSRP > (
    SELECT AVG(MSRP) + 2 * STDDEV(MSRP)
    FROM cars
)
ORDER BY MSRP DESC;
```

### 18.  --Identifies premium car brands.
```sql
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
```

### 19.  Cars giving the best performance per price
```sql
SELECT Make, Model,
       MSRP / Horsepower AS price_per_hp
FROM cars
ORDER BY price_per_hp;
```

### 20.  Cars balancing performance and fuel efficiency
```sql
SELECT Make, Model,
       Horsepower * MPG_Highway AS performance_score
FROM cars
ORDER BY performance_score DESC
LIMIT 10;
```

### 21.   Market share of each brand
```sql
SELECT Make,
       COUNT(*) AS total_cars,
       ROUND(COUNT(*) * 100.0 /
       (SELECT COUNT(*) FROM cars),2) AS market_share_percentage
FROM cars
GROUP BY Make
ORDER BY market_share_percentage DESC;
```

### 22.   Avg_Horsepower per Car Type
```sql
SELECT Type, AVG(Horsepower) AS avg_horsepower
FROM cars
GROUP BY Type
ORDER BY avg_horsepower DESC;
```

## 🚀 Key SQL Concepts Used

- Aggregations (AVG, COUNT, MIN, MAX)
- GROUP BY and HAVING
- Subqueries
- Window Functions (RANK, PERCENT_RANK)
- Common Table Expressions (CTE)
- Statistical analysis using STDDEV

  
---

📈 Insights & Conclusions### 
• The average car price is around $32,804, which shows that most cars fall into the mid-range segment.

• Luxury brands like Mercedes-Benz, Porsche, and Jaguar dominate the high-price category in the dataset.

• Porsche 911 GT2 is the most expensive car, making it a major price outlier compared to other vehicles.

• SUVs and sports cars tend to have higher horsepower, indicating stronger performance vehicles in these categories.

• Some cars provide better performance per price, making them high-value options for buyers.



---

✍️ Author
This project  created by Aishwarya Nair, a passionate data analyst with a focus on SQL and data-driven insights. Feel free to connect with me for collaboration, inquiries, or networking!

GitHub: https://github.com/aishwariyanair

LinkedIn: https://www.linkedin.com/in/aishwaryaajnair

Email: aishwaryanair020@gmail.com















Weight, Wheelbase, Length – Physical specifications of the car
