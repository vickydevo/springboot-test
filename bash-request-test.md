Bash Script (For Ubuntu / Linux)
This script uses a for loop and curl to hit your endpoint 100 times with a small delay.

Bash

#!/bin/bash

# Configuration
URL="http://<MINIKUBE_IP>:<NODE_PORT>"
REQUESTS=100
DELAY=0.5

echo "Starting stress test on $URL..."

for ((i=1; i<=REQUESTS; i++))
do
   RESPONSE=$(curl -s $URL)
   echo "Request $i: $RESPONSE"
   sleep $DELAY
done

echo "Test Complete. Check your Grafana dashboard for 'vignan_app_requests_total'."
How to run:

Save as test.sh.

Run chmod +x test.sh.

Execute with ./test.sh.
