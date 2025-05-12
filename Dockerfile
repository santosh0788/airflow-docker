# Use official Airflow image as base (or python base if you're customizing heavily)
FROM apache/airflow:2.7.2-python3.8

# Set environment variables
ENV AIRFLOW_HOME=/home/airflow

# Copy your entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install system dependencies
USER root
RUN apt-get update && \
    apt-get install -y libodbc1 unixodbc && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir pyarrow>=10.0.1,<11.0.0

# Set Airflow working directory
WORKDIR $AIRFLOW_HOME

# Run the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
