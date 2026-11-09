#!/bin/bash

set -e

trap 'echo "Error occurred at line $LINENO. Exiting..."' ERR

echo "hello, guys"
echo "I am learning shell scripting"
echho "printing error message"
echo "no error message"