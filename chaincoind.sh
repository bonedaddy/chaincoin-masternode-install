#! /bin/bash
primary_interface_ip=$(ifconfig | head -n 2 | sed '1d' | awk '{print $2}' | awk -F ':' '{print $2}')
chaincoind --daemon & # append to background 
echo "We're now going to wait 900 seconds to allow chaincoind time to sync"
sleep 900
chaincoind getinfo
echo "We are now goign to generate a wallet addrress to deposit CHC into"
account_addr_0=$(chaincoind getaccountaddress 0)
ehco "$account_addr_0" > "~/account_addr_0"
echo "$account_addr_0"
echo "Please send exactly 1000 CHC to this address in one transaction from cryptopia making sure to account for the fee"
echo "This may mean you might have to send 1000.001CHC"
echo "Sleeping for 60 seconds"
sleep 60
echo "Generate masternode key and saving it to a file"
chaincoind masternode genkey > chaincoind_masternode_key
echo "Stopping chaincoind"
chaincoind stop 
echo "Sleeping for 60 seconds"
sleep 60
echo "listen=1" >> ~/.chaincoin/chaincoin.conf
echo "masternode=1" >> ~/.chaincoin/chaincoin.conf
echo "masternodeprivkey=$(cat chaincoind_masternode_key)" >> ~/.chaincoin/chaincoin.conf
echo "masternodeaddr=$primary_interface_ip:11994" >> ~/.chaincoin/chaincoin.conf
chaincoind --daemon &
echo "Waiting for 15 transactions. Sleeping for 1800 seconds"
sleep 1800
chaincoind masternode start
