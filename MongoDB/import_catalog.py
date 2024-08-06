import json
from pymongo import MongoClient

# MongoDB connection setup
client = MongoClient('mongodb://localhost:27017/')
db = client.catalog
collection = db.electronics

# Load data from catalog.json
with open('catalog.json') as f:
    data = json.load(f)

# Insert data into the electronics collection
collection.insert_many(data)
print("Data imported successfully.")

# Run test queries
print("Running test queries...")
print("Count of documents in the collection:", collection.count_documents({}))
print("Sample document:", collection.find_one())

# Close the MongoDB connection
client.close()
