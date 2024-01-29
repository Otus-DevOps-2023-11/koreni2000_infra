#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
echo "Start update"
sudo apt-get update -y
sleep 30
echo "Install git"
sudo apt-get install -y git
sleep 30
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
# Update Python version 3.8
sudo apt -y update
sudo add-apt-repository -y ppa:jblgf0/python
sudo apt -y update
sudo apt -y install python3.8
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
