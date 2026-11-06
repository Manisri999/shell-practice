#!/bin/bash

NUM1=100
NUM2=mani

SUM=$(($NUM1 + $NUM2))
echo "Sum: $SUM"

#array
FRUITS=("apple" "banana" "cherry")

echo "Fruits are: ${FRUITS[@]}"
echo "First fruit: ${FRUITS[0]}"