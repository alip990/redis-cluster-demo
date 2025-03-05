#!/bin/sh

sleep 5
echo "yes" | redis-cli --cluster create \
  redis_1:6379 \
  redis_2:6379 \
  redis_3:6379 \
  redis_4:6379 \
  redis_5:6379 \
  redis_6:6379 \
  --cluster-replicas 1
echo " Redis cluster ready."