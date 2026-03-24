# Automobile Market Analysis

##  **Project Overview**
This project performs exploratory data analysis on a car dataset using SQL to understand pricing trends, brand performance, fuel efficiency, and vehicle specifications.
The goal is to extract meaningful insights that could help automobile companies, dealerships, and analysts understand market patterns and product positioning.


##  **Dataset Overview**

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

##  SQL Analysis Queries

##  **SQL Queries Answered**

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

## Project Preview
<img width="1920" height="1200" alt="Screenshot (308)" src="https://github.com/user-attachments/assets/180a6af2-ea56-4986-bbd2-ef3c88af0384" />
<img width="1920" height="1200" alt="Screenshot (309)" src="https://github.com/user-attachments/assets/814c57c8-81b3-4d2c-a1cd-dee1db2bcec4" />
<img width="1920" height="1200" alt="Screenshot (310)" src="https://github.com/user-attachments/assets/ba4e5038-2ca2-4132-9710-77147926b33c" />
<img width="1920" height="1200" alt="Screenshot (311)" src="https://github.com/user-attachments/assets/4e320885-7b2c-48f6-92d9-736cc4ed945d" />
<img width="1920" height="1200" alt="Screenshot (312)" src="https://github.com/user-attachments/assets/9d55b78b-aa5f-4175-add0-423109db6b1f" />



```

##  Key SQL Concepts Used

- Aggregations (AVG, COUNT, MIN, MAX)
- GROUP BY and HAVING
- Subqueries
- Window Functions (RANK, PERCENT_RANK)
- Common Table Expressions (CTE)
- Statistical analysis using STDDEV

  
---

 Insights & Conclusions### 
• The average car price is around $32,804, which shows that most cars fall into the mid-range segment.

• Luxury brands like Mercedes-Benz, Porsche, and Jaguar dominate the high-price category in the dataset.

• Porsche 911 GT2 is the most expensive car, making it a major price outlier compared to other vehicles.

• SUVs and sports cars tend to have higher horsepower, indicating stronger performance vehicles in these categories.

• Some cars provide better performance per price, making them high-value options for buyers.



---

Author
This project  created by Aishwarya Nair, a passionate data analyst with a focus on SQL and data-driven insights. Feel free to connect with me for collaboration, inquiries, or networking!

GitHub: https://github.com/aishwariyanair

LinkedIn: https://www.linkedin.com/in/aishwaryaajnair

Email: aishwaryanair020@gmail.com















Weight, Wheelbase, Length – Physical specifications of the car
