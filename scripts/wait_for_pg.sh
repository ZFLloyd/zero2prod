#!/bin/sh
# wait-for-postgres.sh

set -e



until PGPASSWORD="postgres" psql -h "localhost:5432" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
