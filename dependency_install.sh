#! /bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install automake -y
sudo apt-get install libdb++-dev -y
sudo apt-get install build-essential libtool autotools-dev -y
sudo apt-get install autoconf pkg-config libssl-dev -y
sudo apt-get install libboost-all-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install git -y
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo apt-get install g++ -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
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