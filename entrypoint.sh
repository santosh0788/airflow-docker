#!/bin/bash

# Exit on any failure
set -e

# Initialize the Airflow metadata database
airflow db init

# Create default user (optional, modify as needed)
airflow users create \
    --username admin \
    --password admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com

# Start the Airflow webserver
exec airflow webserver
