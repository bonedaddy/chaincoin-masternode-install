#! /bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 8333
sudo ufw allow 11994
sudo ufw defualt deny incoming
sudo ufw defualt allow outgoign
sudo ufw enable