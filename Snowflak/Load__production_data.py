import os
import pandas as pd
import snowflake.connector

# Snowflake connection setup
conn = snowflake.connector.connect(
    user='DAVID2342',
    password='********',
    account='um76382.eu-central-2.aws'
)
cursor = conn.cursor()

# Function to load CSV into Snowflake
def load_csv_to_snowflake(table_name, csv_file_path):
    df = pd.read_csv(csv_file_path)
    columns = df.columns
    values = [tuple(x) for x in df.to_numpy()]

    # Generate insert query
    insert_query = f'INSERT INTO {table_name} ({", ".join(columns)}) VALUES ({", ".join(["%s"] * len(columns))})'
    
    cursor.executemany(insert_query, values)
    conn.commit()
    print(f"Data from {csv_file_path} loaded into {table_name} successfully.")

# Folder containing the CSV files
data_folder = '../data'

# Dictionary to map CSV files to table names
csv_to_table_map = {
    'DimCategory.csv': 'DimCategory',
    'DimCountry.csv': 'DimCountry',
    'DimDate.csv': 'DimDate',
    'FactSales.csv': 'FactSales'
}

# Load each CSV file into the corresponding Snowflake table
for csv_file, table_name in csv_to_table_map.items():
    csv_file_path = os.path.join(data_folder, csv_file)
    load_csv_to_snowflake(table_name, csv_file_path)

# Close the Snowflake connection
cursor.close()
conn.close()
