#!/bin/bash
# Update Python version 3.8
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
sudo apt -y update
sleep 30
sudo apt install -y software-properties-common
# sudo apt-get install -y build-essential checkinstall
# sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev \
#     libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
sleep 10
sudo apt -y update
sudo add-apt-repository -y ppa:jblgf0/python
sudo apt-get update
python3 --version
# sudo apt-get install -y python3.9
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
# sudo apt purge -y python3.5
# sudo cd /usr/lib/python3/dist-packages
# sudo ln -s apt_inst.cpython-35m-x86_64-linux-gnu.so apt_inst.so
# sudo ln -s apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.so
sudo apt --fix-missing purge $(dpkg -l | grep 'python3.9' | awk '{print $2}')
sudo apt --fix-broken install
sudo apt  -y upgrade
python3 --version
sudo apt install -y python3.9
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
cd /usr/lib/python3/dist-packages
sudo ln -s apt_inst.cpython-35m-x86_64-linux-gnu.so apt_inst.so
sudo ln -s apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.so
sudo apt purge -y python3.5
python3 --version
