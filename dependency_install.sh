#! /bin/bash

sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install automake autoconf autotools-dev build-essential git g++ libboost-all-dev libdb4.8-dev libdb4.8++-dev libdb++-dev libminiupnpc-dev libtool libssl-dev pkg-config python-software-properties software-properties-common -y
cd ~
mkdir chaincoin-source
cd chaincoin-source
git clone https://github.com/chaincoin/chaincoin.git 
cd chaincoin
bash autogen.sh
bash configure --without-gui
make
sudo make install
cd ~/.chaincoin || mkdir ~/.chaincoin && cd ~/.chaincoin
if [[ -z "chaincoin.conf" ]]; then
    touch chaincoin.conf
fi

echo "[INFO] Please configure chaincoin.conf manually"
echo "[INFO] After doing so please run the chaincoind.sh script"
sleep 5
