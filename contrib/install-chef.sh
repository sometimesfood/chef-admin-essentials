#!/bin/bash
echo 'deb http://apt.opscode.com/ lucid main' | sudo tee /etc/apt/sources.list.d/opscode.list
wget -qO - "http://apt.opscode.com/packages@opscode.com.gpg.key" | sudo apt-key add -
sudo aptitude update
sudo DEBIAN_FRONTEND=noninteractive aptitude -y -q install chef
sudo update-rc.d -f chef-client remove
