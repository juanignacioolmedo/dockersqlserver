#!/bin/bash
# wait-for-sql.sh

host="$1"
port="$2"
user="sa"
password="YourStrong123Passw0rd"

echo "Waiting for SQL Server to start on $host:$port..."

until /opt/mssql-tools/bin/sqlcmd -S "$host,$port" -U "$user" -P "$password" -Q "SELECT 1" > /dev/null 2>&1; do
  sleep 1
done

echo "SQL Server is up and running!"
