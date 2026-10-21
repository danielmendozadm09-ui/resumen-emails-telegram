FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY main.py .

# Contenedor en espera; el script se lanza con un Cron Job de EasyPanel (python main.py)
CMD ["sleep", "infinity"]
