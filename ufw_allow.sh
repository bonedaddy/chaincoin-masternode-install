#! /bin/bash
sudo ufw allow OpenSSH
sudo ufw allow 8333
sudo ufw allow 11994
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable