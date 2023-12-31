#!/bin/sh
#install mongodb
apt update
DEBIAN_FRONTEND=noninteractive apt -y install mongodb
systemctl start mongodb
systemctl enable mongodb
