# Use an official Python runtime as an image
FROM python:3.9.11-alpine3.14

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

WORKDIR /app
COPY . /app

ENTRYPOINT ["gunicorn", "-w 4", "--bind", "0.0.0.0:8000", "--access-logfile", "-", "--error-logfile", "-", "server:app"]