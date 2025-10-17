FROM python:3.10-slim 

WORKDIR /app

COPY . . 

COPY requirements.txt .
COPY alembic.ini .

RUN pip install --no-cache-dir -r requirements.txt

COPY . . 

RUN chmod +x /app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
