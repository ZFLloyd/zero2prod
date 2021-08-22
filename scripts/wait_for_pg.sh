#!/bin/sh
# wait-for-postgres.sh

set -e

host="$1"
shift

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi



>&2 echo "Postgres is up - executing command"
