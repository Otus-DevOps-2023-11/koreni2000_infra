#!/bin/sh
#install mongodb
apt update
sleep 30
DEBIAN_FRONTEND=noninteractive apt -y install mongodb
systemctl start mongodb
systemctl enable mongodb
