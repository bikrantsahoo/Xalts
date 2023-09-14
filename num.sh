#!/bin/bash

generate_random_number() {
  echo $((RANDOM % 10))
}
echo -n > test.txt

for ((i=0; i<10; i++)); do
  random_number=$(generate_random_number)
  echo $random_number >> test.txt
done
echo "Random numbers have been written to test.txt"
