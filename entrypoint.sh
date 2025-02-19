#!/bin/sh

sleep 5
echo "yes" | redis-cli --cluster create \
  174.10.0.2:6379 \
  174.10.0.3:6379 \
  174.10.0.4:6379 \
  174.10.0.5:6379 \
  174.10.0.6:6379 \
  174.10.0.7:6379 \
  --cluster-replicas 1
echo " Redis cluster ready."