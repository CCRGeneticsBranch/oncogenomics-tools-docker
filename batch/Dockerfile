FROM python:3.6-slim

RUN apt-get update && apt-get install -y pkg-config libmariadb-dev gcc\
    && apt-get clean\
    && apt-get autoremove\
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

CMD sleep infinity

