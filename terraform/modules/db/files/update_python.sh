# Update Python version 3.8
sudo apt -y update
sudo add-apt-repository -y ppa:jblgf0/python
sudo apt -y update
sudo apt -y install python3.9
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
