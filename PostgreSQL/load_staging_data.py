import os
import pandas as pd
import psycopg2
from psycopg2 import sql

# PostgreSQL connection setup
conn = psycopg2.connect(
    host="127.0.0.1",
    database="Sales",
    user="postgres",
    password="********"
)
cursor = conn.cursor()

# Function to load CSV into PostgreSQL
def load_csv_to_postgres(table_name, csv_file_path):
    df = pd.read_csv(csv_file_path)
    columns = df.columns
    values = [tuple(x) for x in df.to_numpy()]
    
    insert_query = sql.SQL(
        'INSERT INTO {table} ({fields}) VALUES %s'
    ).format(
        table=sql.Identifier(table_name),
        fields=sql.SQL(',').join(map(sql.Identifier, columns))
    )
    
    psycopg2.extras.execute_values(cursor, insert_query, values)
    conn.commit()
    print(f"Data from {csv_file_path} loaded into {table_name} successfully.")

# Folder containing the CSV files
data_folder = 'data'

# Dictionary to map CSV files to table names
csv_to_table_map = {
    'DimCategory.csv': 'dim_category',
    'DimCountry.csv': 'dim_country',
    'DimDate.csv': 'dim_date',
    'FactSales.csv': 'fact_sales'
}

# Load each CSV file into the corresponding PostgreSQL table
for csv_file, table_name in csv_to_table_map.items():
    csv_file_path = os.path.join(data_folder, csv_file)
    load_csv_to_postgres(table_name, csv_file_path)

# Close the PostgreSQL connection
cursor.close()
conn.close()
