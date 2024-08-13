#!/bin/sh

# Wait for the database to be ready
while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
  sleep 1
done
echo "Database is ready"

# Execute SQL files in data/MySQL
for file in /app/data/MySQL/*; do
  mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -D $MYSQL_DATABASE < $file
done
echo "All SQL files have been executed"

# Start the application
echo "Starting the application"
exec "$@"