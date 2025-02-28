#!/bin/bash

NODE_COUNT=${NODE_COUNT:-"5"}

REWARD_ADDRESS=${REWARD_ADDRESS}

for ((COUNT=1; COUNT<=NODE_COUNT; COUNT++)); do
    echo "start $COUNT node"
    mkdir -p /root/antnode_data/node_$COUNT
    ./antnode --rewards-address $REWARD_ADDRESS --root-dir /root/antnode_data/node_$COUNT "$@" evm-arbitrum-one &
    sleep 0.3
done

wait
