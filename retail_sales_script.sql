SELECT * FROM retail_sales_dataset;

-- Create staging table for editing
CREATE TABLE retail_sales_stage LIKE retail_sales_dataset;

-- Insert data into staging table from original table
INSERT INTO retail_sales_stage
SELECT * FROM retail_sales_dataset;

SELECT * FROM retail_sales_stage;

SELECT COUNT(*) FROM retail_sales_stage; 

-- Number of Male and Female Customers
SELECT Gender, COUNT('Customer ID') AS 'Number of Customers by Gender'
FROM retail_sales_stage
GROUP BY Gender;

-- Average age of Male and Femal Customers
SELECT Gender, AVG(Age) AS 'Average Age by Gender'
FROM retail_sales_stage
GROUP BY Gender;

-- Order of Age
SELECT Gender, Age AS 'Age in Order'
FROM retail_sales_stage
ORDER BY Age;

SELECT MAX(Age) AS 'Maximum Age'
FROM retail_sales_stage;

SELECT MIN(Age) AS 'Minimum Age'
FROM retail_sales_stage;

-- Checking Unique Product Categories
SELECT DISTINCT `Product Category` FROM retail_sales_stage;

-- Total Amount of Products sold from each Category
SELECT `Product Category`, SUM(Quantity) AS 'Total Quantity of Product Sold by Category'
FROM retail_sales_stage
GROUP BY `Product Category`;

-- Total Amount made from sales 
SELECT SUM(`Total Amount`) AS 'Total Sales' FROM retail_sales_stage;

-- Total Amount of Money made from selling Product from each Category
SELECT `Product Category`, SUM(`Total Amount`) AS 'Total Amount made from Product Sold by Category'
FROM retail_sales_stage
GROUP BY `Product Category`;

-- Average Amount of Money made from selling Product from each Category
SELECT `Product Category`, AVG(`Total Amount`) AS 'Total Amount made from Product Sold by Category'
FROM retail_sales_stage
GROUP BY `Product Category`;

-- Total amount of quantity sold
SELECT SUM(Quantity) AS 'Total Quantity' FROM retail_sales_stage;

-- Comparison of total amount sold to total amount made by categories
SELECT `Product Category`, SUM(Quantity) AS 'Tot quant sold', SUM(`Total Amount`) AS 'Tot Amount made from Product'
FROM retail_sales_stage
GROUP BY `Product Category`;

-- Standardizing age groups
-- Determining Age Groups
SELECT Age FROM retail_sales_stage
WHERE Age < 25 -- Young Adult
ORDER BY Age ASC;

SELECT Age FROM retail_sales_stage
WHERE Age > 24 AND Age < 40 -- Adult
ORDER BY Age ASC;

SELECT Age FROM retail_sales_stage
WHERE Age > 39 AND Age < 55 -- Middle-Age
ORDER BY Age ASC;

SELECT Age FROM retail_sales_stage
WHERE Age > 54 AND Age < 65 -- Older Adult
ORDER BY Age ASC;

-- Update Age groups into table
ALTER TABLE retail_sales_stage
ADD COLUMN `Age Range` TEXT;

UPDATE retail_sales_stage SET
`Age Range` = 'Young Adult' WHERE Age < 25;

UPDATE retail_sales_stage SET
`Age Range` = 'Adult' WHERE Age > 24 AND Age < 40;
 
UPDATE retail_sales_stage SET 
`Age Range` = 'Middle-Aged' WHERE Age > 39 AND Age < 55;

UPDATE retail_sales_stage SET 
`Age Range` = 'Older Adult' WHERE Age > 54 AND Age < 65;

-- Which Age range buys more products
SELECT `Age Range`, SUM(Quantity) AS 'Which age buys more'
FROM retail_sales_stage
GROUP BY `Age Range`;

-- Which Age range buys more on which catergory

SELECT `Age Range`, `Product Category`, SUM(Quantity) AS Total_Quantity
FROM retail_sales_stage
GROUP BY `Age Range`, `Product Category`
ORDER BY `Product Category`, Total_Quantity DESC;

-- Which Age range spends more on which catergory
SELECT `Age Range`, `Product Category`, SUM(Quantity * `Price Per Unit`) AS Total_Spent
FROM retail_sales_stage
GROUP BY `Age Range`, `Product Category`
ORDER BY `Product Category`, Total_Spent DESC;

-- Checking sales over time by category
SELECT `Date`, `Product Category`, Quantity, `Price Per Unit` FROM retail_sales_stage
WHERE `Product Category` = 'Clothing'
ORDER BY `Date` ASC;

SELECT `Date`, `Product Category` FROM retail_sales_stage
WHERE `Product Category` = 'Beauty'
ORDER BY `Date` ASC;

SELECT `Date`, `Product Category` FROM retail_sales_stage
WHERE `Product Category` = 'Electronics'
ORDER BY `Date` ASC;






SELECT `Product Category`, `Price Per Unit`
FROM retail_sales_stage
ORDER BY `Price Per Unit`;

SELECT Quantity, `Price Per Unit`
FROM retail_sales_stage
ORDER BY `Price Per Unit`;

SELECT `Product Category`, Quantity, `Price Per Unit`
FROM retail_sales_stage
ORDER BY `Price Per Unit` DESC;

SELECT * FROM retail_sales_stage;