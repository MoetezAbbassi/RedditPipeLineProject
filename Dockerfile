FROM apache/airflow:2.7.1-python3.9


COPY ./path/to/local/files /opt/airflow/local_files
RUN mkdir -p /opt/airflow/local_files && \
    if [ "$(ls -A /opt/airflow/local_files 2>/dev/null)" ]; then \
        pip install --no-cache-dir /opt/airflow/local_files/*; \
    else \
        echo "No local files to install"; \
    fi


COPY requirements.txt /opt/airflow/

USER root
RUN apt-get update && apt-get install -y gcc python3-dev

USER airflow

RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt