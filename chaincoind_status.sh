#! /bin/bash

check=$(ps -ef | grep -i chaincoind | grep -v grep)


# -z checks if string is zero which would indicate that no process was found
if [[ -z "$check" ]]; then
        echo "Chaincoind is not running" > /dev/null
        echo "0"
else
        echo "Chaincoind is running" > /dev/null
        echo "1"
fi
