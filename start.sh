#!/bin/bash

# memory cpus time

echo "############################################"
echo -n "Memory Available: "
echo $[$(cat /sys/fs/cgroup/memory.max) / 1024 / 1024]m

echo -n "CPU Available (millicores): "
echo $[ $(cat /sys/fs/cgroup/cpu.max | awk '{print $1}') / 100 ]
echo "############################################"
echo

echo "Waiting $DELAY seconds..."
sleep $DELAY

./load_memory.sh $1 &
memory_pid=$!

./load_cpu.sh $2 $3 &

echo "Sleeping $3 seconds..."
sleep $3
echo "CPU Done"
echo "Freeing memory..."
kill $memory_pid

echo "Sleeping..."
sleep infinity