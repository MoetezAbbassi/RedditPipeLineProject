FROM apache/airflow:2.10.4-python3.12

COPY requirements.txt /opt/airflow/

USER root
RUN apt-get update && apt-get install -y gcc python3-dev

USER airflow

