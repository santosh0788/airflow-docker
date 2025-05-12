# Your Dockerfile
FROM apache/airflow:2.7.0

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"] #hai
