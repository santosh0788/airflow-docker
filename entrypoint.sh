#!/bin/bash

# Initialize the Airflow database
if [ "$1" = "webserver" ]; then
  airflow db init
  airflow users create \
    --username admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com \
    --password admin
fi

# Execute the Airflow command passed to the container
exec airflow "$@"
