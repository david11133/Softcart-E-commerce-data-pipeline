# SoftCart Data Engineering Project
## Objectives
- Demonstrate proficiency in skills required for an entry-level data engineering role.
- Design and implement various concepts and components in the data engineering lifecycle.
- Showcase working knowledge with relational databases, NoSQL data stores, big data engines, data warehouses, and data pipelines.
- Apply skills in Linux shell scripting, SQL, and Python programming languages to Data Engineering problems.

![Data Platform Architecture](data-platform-architecture.png)

## Project Overview
SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles, and tablets. This project involves designing and implementing various data repositories and pipelines to support SoftCart's operations and analytics.

## Data Sources and Repositories
- MongoDB: Stores catalog data of the products.
- MySQL: Manages transactional data like inventory and sales.
- PostgreSQL: Used for the staging data warehouse.
- IBM DB2: Serves as the production data warehouse on the cloud.
- Hadoop: Used as the big data platform for analytics.
- Apache Spark: Utilized for big data analysis on the Hadoop cluster.

## Tools and Software
- ETL Pipelines: Managed using Apache Airflow.
- BI Dashboards: Created with IBM Cognos Analytics.

## Assignment Breakdown
### 1. MySQL Online Transactional Processing Database
- Task: Design the database schema for storing sales data, create an index on the timestamp column, and write a bash script to export sales data into a SQL file.
- Tools: MySQL, Bash scripting.
### 2. MongoDB NoSQL Catalog Database
- Task: Create the catalog database and import electronics products from catalog.json into a collection named electronics. Run test queries and export the collection to electronics.csv using only the _id, type, and model fields.
- Tools: MongoDB.
### 3. PostgreSQL Staging Data Warehouse
- Task: Design a data warehouse star schema using pgAdmin ERD design tool, extract sales data from MySQL and catalog data from MongoDB, and store it in the PostgreSQL staging data warehouse. Generate reports such as total sales per year per country, total sales per month per category, total sales per quarter per country, and total sales per category per country.
- Tools: PostgreSQL, pgAdmin.
### 4. IBM Db2 Production Data Warehouse
- Task: Create an IBM DB2 instance using the adjusted schema design, load sample datasets into the tables, write aggregation queries, and create a Materialized Query Table for future reports.
- Tools: IBM DB2.
### 5. Python Scripts & Automation
- Task: Automate the synchronization process between the staging data warehouse and production data warehouse by regularly updating the DB2 instance with new records from MySQL.
- Tools: Python.
### 6. Apache Airflow ETL & Data Pipelines
- Task: Write an Airflow DAG pipeline that analyzes the web server log files (accesslog.txt), extracts the required lines and fields, transforms and loads the data to an existing file.
- Tools: Apache Airflow.
### 7. Apache Spark Big Data Analytics
- Task: Run analytic queries on the search terms data using PySpark and JupyterLab. Use a pretrained sales forecasting model to predict the sales for 2023.
- Tools: Apache Spark, PySpark, JupyterLab.

## Project Structure
```graphql
├── mysql/
│   ├── schema.sql
│   ├── export_sales.sh
│   └── sample_sales_data.sql
├── mongodb/
│   ├── import_catalog.py
│   ├── catalog.json
│   └── export_electronics.py
├── postgresql/
│   ├── erd_design.pgerd
│   ├── staging_schema.sql
│   └── load_staging_data.py
├── db2/
│   ├── production_schema.sql
│   ├── load_production_data.py
│   └── aggregation_queries.sql
├── python_scripts/
│   └── sync_databases.py
├── airflow/
│   └── dag_pipeline.py
├── spark/
│   ├── search_terms_analysis.ipynb
│   └── sales_forecasting_model.pkl
└── README.md
```





## Project Outline
- SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets.
- All the catalog data of the products is stored in the MongoDB NoSQL server.
- All the transactional data like inventory and sales are stored in the MySQL database server.
- SoftCart's webserver is driven entirely by these two databases.
- Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL.
- Production data warehouse is on the cloud instance of IBM DB2 server.
- BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards.
- SoftCart uses Hadoop cluster as it big data platform where all the data collected for analytics purposes.
- Spark is used to analyse the data on the Hadoop cluster.
- To move data between OLTP, NoSQL and the dataware house ETL pipelines are used and these run on Apache Airflow.

## Assignment Briefs

### 1. MySQL Online Transactional Processing Database
SoftCart will be using MySQL for our online transactional processing, such as storing inventory and sales data. Based on the sample data given, design the database schema and create a database to store our sales data. Create an index on the timestamp column and write an administrative bash script that exports sales data into a SQL file.

### 2. MongoDB NoSQL Catalog Database
All of SoftCart's catalog data will be stored on a MongoDB NoSQL server. Create the database `catalog` and import our electronics products from `catalog.json` into a collection named `electronics`. Run test queries against the data and export the collection into a file named `electronics.csv` using only the `_id`, `type`, and `model` fields.

### 3. PostgreSQL Staging Data Warehouse
Sales data from MySQL and catalog data from MongoDB will be periodically extracted and stored into a staging data warehouse running on PostgreSQL. The data will then be transformed and loaded into a production data warehouse running on IBM Db2 to generate reports such as:
- total sales per year per country
- total sales per month per category
- total sales per quarter per country
- total sales per category per country

Design a data warehouse star schema using the pgAdmin ERD design tool, ensuring the table can generate yearly, monthly, daily, and weekly reports. Export the schema SQL and create a staging database. Your Senior Data Engineer will then review your schema design. Make any necessary adjustments before moving to the next phase.

### 4. IBM Db2 Production Data Warehouse
Using the adjusted schema design, create an instance of IBM DB2 and load the sample datasets into their respective tables. Write aggregation queries and create a Materialized Query Table for future reports.

### 5. Python Scripts & Automation
SoftCart needs to keep data synchronized between different databases/data warehouses as a part of our daily routine. One task that is routinely performed is the sync up of staging data warehouse and production data warehouse. Write a script that will automate the process of regularly updating the DB2 instance with new records from MySQL.

### 6. Apache Airflow ETL & Data Pipelines
SoftCart has imported web server log files as `accesslog.txt`. Write an Airflow DAG pipeline that analyzes the log files, extracts the required lines and fields, transforms and loads the data to an existing file.

### 7. Apache Spark Big Data Analytics
Our team has prepared a set of data containing search terms on our e-Commerce platform. Download the data and run analytic queries on it using `pyspark` and `JupyterLab`. Use a pretrained sales forecasting model to predict the sales for 2023.

## Tools/Software
- **OLTP Database** - MySQL
- **NoSql Database** - MongoDB
- **Production Data Warehouse** – DB2 on Cloud
- **Staging Data Warehouse** – PostgreSQL
- **Big Data Platform** - Hadoop
- **Big Data Analytics Platform** – Spark
- **Business Intelligence Dashboard** - IBM Cognos Analytics
- **Data Pipelines** - Apache Airflow
