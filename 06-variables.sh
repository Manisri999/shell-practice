#!/bin/bash

START_TIME=$(date +%s)

echo "Current timestamp: $START_TIME"

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$((END_TIME - START_TIME))

echo "Total time taken: $TOTAL_TIME seconds"