#!/bin/bash

sudo sed -i "s/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/" /etc/mongodb.conf
sudo systemctl restart mongodb.service
# Update Python version 3.8
sudo apt -y update
sudo add-apt-repository -y ppa:jblgf0/python
sudo apt -y update
sudo apt -y install python3.8
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
