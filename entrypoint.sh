#!/bin/bash

# Exit on any error
set -e

# Initialize the Airflow database if running the webserver
if [ "$1" = "webserver" ]; then
  airflow db init
  airflow users create \
    --username admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com \
    --password admin || echo "Admin user already exists."
fi

# Pass all arguments to Airflow
exec airflow "$@"
