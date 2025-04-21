#!/bin/bash

# Number of requests to send
NUM_REQUESTS=100

echo "Starting load test..."
for i in $(seq 1 $NUM_REQUESTS); do
    response=$(curl -s -w "%{http_code}" -X POST -H "Content-Type: application/json" -d '{"message":"test"}' http://localhost:5000/echo -o /dev/null)
    echo "Request $i: Status $response"
    sleep 0.1
done 