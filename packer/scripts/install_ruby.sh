#!/bin/sh
#install ruby
apt update
sleep 10
sudo DEBIAN_FRONTEND=noninteractive apt install -y ruby-full ruby-bundler build-essential
