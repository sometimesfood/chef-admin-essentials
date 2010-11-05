#!/bin/bash
keyserver=subkeys.pgp.net
opscode_key_id=83EF826A

echo 'Adding Opscode repo to sources.list.d...'
echo 'deb http://apt.opscode.com/ lucid main' \
  | sudo tee /etc/apt/sources.list.d/opscode.list > /dev/null
echo 'Adding Opscode key to trusted keyring...'
sudo apt-key adv --keyserver ${keyserver} --recv-keys ${opscode_key_id} > /dev/null
echo 'Updating package lists (this may take a while)...'
sudo apt-get update > /dev/null
echo 'Installing chef...'
sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install chef &> /dev/null || \
{
  echo 'Installation failed.'
  echo 'Please run "apt-get install chef" to see what went wrong.'
  exit 1
}
echo 'Disabling chef-client startup...'
sudo update-rc.d chef-client disable &> /dev/null
