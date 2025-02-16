#!/bin/bash

NODE_COUNT=${NODE_COUNT:-"5"}

REWARD_ADDRESS=${REWARD_ADDRESS}

for ((COUNT=1; CORE<=NODE_COUNT; COUNT++)); do
    echo "start $COUNT node"
    ./antnode --rewards-address $REWARD_ADDRESS --root-dir /root/antnode_data/node_$COUNT evm-arbitrum-one &
done

