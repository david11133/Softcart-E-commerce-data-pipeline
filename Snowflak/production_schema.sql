CREATE OR REPLACE TABLE DimCategory (
    CategoryID INT,
    Category STRING
);

CREATE OR REPLACE TABLE DimCountry (
    CountryID INT,
    Country STRING
);

CREATE OR REPLACE TABLE DimDate (
    DateID INT,
    Date DATE,
    Year INT,
    Quarter INT,
    QuarterName STRING,
    Month INT,
    MonthName STRING,
    Day INT,
    WeekDay INT,
    WeekDayName STRING
);

CREATE OR REPLACE TABLE FactSales (
    SalesID INT,
    DateID INT,
    CountryID INT,
    CategoryID INT,
    Amount FLOAT
);
