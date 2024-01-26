#!/bin/sh
#install ruby
apt update
sleep 30
sudo DEBIAN_FRONTEND=noninteractive apt install -y ruby-full ruby-bundler build-essential
