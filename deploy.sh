#!/bin/bash
#deploy app
sudo apt update
sudo apt install git -y
cd ~/
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
