#!/bin/bash
set -e

echo "🚀 Running Alembic migrations..."
alembic upgrade head

echo "✅ Migration complete. Starting FastAPI..."
exec uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
