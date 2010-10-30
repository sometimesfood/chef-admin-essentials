#!/bin/bash
keyserver=subkeys.pgp.net
opscode_key_id=83EF826A

echo 'Adding Opscode repo to sources.list.d...'
echo 'deb http://apt.opscode.com/ lucid main' | sudo tee /etc/apt/sources.list.d/opscode.list > /dev/null
echo 'Adding Opscode key to trusted keyring...'
sudo apt-key adv --keyserver ${keyserver} --recv-keys ${opscode_key_id} 2>&1 > /dev/null
echo 'Updating package lists (this may take a while)...'
sudo aptitude update > /dev/null
echo 'Installing chef...'
sudo DEBIAN_FRONTEND=noninteractive aptitude -y -q install chef > /dev/null
echo 'Removing chef-client from default runlevel...'
sudo update-rc.d -f chef-client remove > /dev/null
