#!/bin/sh

# Wait for containers to be ready
sleep 5

# apt-get update && apt-get install -y dnsutils

# Get IP addresses for each Redis container
REDIS1_IP=$(nslookup redis_1 | awk '/^Address: / {ip=$2} END {print ip}')
REDIS2_IP=$(nslookup redis_2 | awk '/^Address: / {ip=$2} END {print ip}')
REDIS3_IP=$(nslookup redis_3 | awk '/^Address: / {ip=$2} END {print ip}')
REDIS4_IP=$(nslookup redis_4 | awk '/^Address: / {ip=$2} END {print ip}')
REDIS5_IP=$(nslookup redis_5 | awk '/^Address: / {ip=$2} END {print ip}')
REDIS6_IP=$(nslookup redis_6 | awk '/^Address: / {ip=$2} END {print ip}')

echo "Creating cluster using IP addresses:"
echo "$REDIS1_IP:6379, $REDIS2_IP:6379, $REDIS3_IP:6379, $REDIS4_IP:6379, $REDIS5_IP:6379, $REDIS6_IP:6379"

# Create the Redis cluster using the dynamically retrieved IPs
echo "yes" | redis-cli --cluster create \
  ${REDIS1_IP}:6379 \
  ${REDIS2_IP}:6379 \
  ${REDIS3_IP}:6379 \
  ${REDIS4_IP}:6379 \
  ${REDIS5_IP}:6379 \
  ${REDIS6_IP}:6379 \
  --cluster-replicas 1

echo "Redis cluster ready."
