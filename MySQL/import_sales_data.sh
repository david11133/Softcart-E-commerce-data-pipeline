#!/bin/bash

# Variables
DB_HOST="127.0.0.1"
DB_USER="mysql"
DB_PASS="*********"
DB_NAME="Sales"
TABLE_NAME="sales_data"
CSV_FILE_PATH="oltp_data.csv"

# Check if the CSV file exists
if [ ! -f "$CSV_FILE_PATH" ]; then
  echo "File not found: $CSV_FILE_PATH"
  exit 1
fi

# Import data into MySQL
mysql --local-infile=1 -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
LOAD DATA LOCAL INFILE '$CSV_FILE_PATH'
INTO TABLE $TABLE_NAME
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(column1, column2, column3, ...);  # replace with your actual column names
EOF

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Data imported successfully into $TABLE_NAME."
else
  echo "Failed to import data into $TABLE_NAME."
  exit 1
fi
