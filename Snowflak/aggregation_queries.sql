-- GROUPING SETS query using the columns country, category, and totalsales
SELECT 
  co.country, 
  ca.category, 
  SUM(s.amount) AS totalsales 
FROM 
  public."FactSales" s 
  JOIN "DimCountry" co ON s.countryid = co.countryid 
  JOIN "DimCategory" ca ON s.categoryid = ca.categoryid
GROUP BY
  co.country, ca.category
ORDER BY
  SUM(s.amount)


-- ROLLUP query using the columns year, country, and totalsales
SELECT
    dd."Year",
    dc.country,
    SUM(fs.amount) AS totalsales 
FROM 
    "FactSales" fs
JOIN "DimDate" dd on fs.dateid = dd.dateid
JOIN "DimCountry" dc on fs.countryid = dc.countryid 
GROUP BY
    dd."Year", dc.country
ORDER BY 
    dd."Year"


-- CUBE query using the columns year, country, and averagesales
SELECT 
    dd."Year",
    dc.country,
    ROUND(AVG(amount), 1) AS average_sales
FROM 
    "FactSales" fs
JOIN "DimDate" dd ON fs.dateid = dd.dateid
JOIN "DimCountry" dc ON fs.countryid = dc.countryid
GROUP BY
    dd."Year",
    dc.country
ORDER BY 
    dd."Year",
    dc.country


-- Materialized Query Table (MQT). create an MQT named total_sales_per_country based on the columns country and totalsales
CREATE TABLE total_sales_per_country (total_sales, country) AS (
    SELECT sum(amount), country
    FROM FactSales
    LEFT JOIN DimCountry
    ON FactSales.countryid = DimCountry.countryid
    GROUP BY (), country
)


SELECT * FROM total_sales_per_country;