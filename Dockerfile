FROM apache/airflow:2.7.2-python3.8

# Set environment variables
ENV AIRFLOW_HOME=/home/airflow

# Switch to root to perform system-level changes
USER root

# Copy entrypoint script and give execute permission
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Install system packages for ODBC etc.
RUN apt-get update && \
    apt-get install -y libodbc1 unixodbc gcc && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN python -m pip install --upgrade pip

# Install compatible Python dependencies
RUN pip install --no-cache-dir "pyarrow>=10.0.1,<11.0.0"

# Switch back to airflow user
USER airflow

# Set working directory
WORKDIR $AIRFLOW_HOME

# Run entrypoint
ENTRYPOINT ["/entrypoint.sh"]
