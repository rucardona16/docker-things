#!/bin/bash
echo "Checking if Cassandra is up and running ..."

set -e
# NOTE: I removed your `cmd` processing in favor of invoking entrypoint.sh
# directly.

# Start Cassandra before waiting for it to boot.
service cassandra start

status=$(nc -z localhost 9042; echo $?)
echo $status

while [ $status != 0 ]
do
  sleep 3s
  status=$(nc -z localhost 9042; echo $?)
  echo $status
done

echo "Cassandra run"
exec cqlsh -e "source 'iotcommerce_schema.cql'"
