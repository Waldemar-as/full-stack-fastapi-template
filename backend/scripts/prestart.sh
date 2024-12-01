#! /usr/bin/env bash

set -e
set -x

echo "Starting prestart.sh script..."

# Let the DB start
echo "Waiting for database to be ready..."
python app/backend_pre_start.py
echo "Database is ready."

# Run migrations
echo "Running database migrations..."
alembic upgrade head
echo "Migrations completed successfully."

# Create initial data in DB
echo "Creating initial data..."
python app/initial_data.py
echo "Initial data created successfully."

echo "All prestart tasks completed successfully."
