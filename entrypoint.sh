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

# Start the Airflow webserver on all interfaces and correct port
exec airflow webserver --host 0.0.0.0 --port 8080
