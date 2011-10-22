#!/bin/bash
keyserver=keys.gnupg.net
opscode_key_id=83EF826A
distribution=$(lsb_release -sc)

# fall back to natty for oneiric since there's no oneiric chef repo yet
[ $distribution = 'oneiric' ] && distribution='natty'

echo 'Adding Opscode repo to sources.list.d...'
cat <<EOS | sudo tee /etc/apt/sources.list.d/opscode.list > /dev/null
deb     http://apt.opscode.com/ ${distribution}-0.10 main #Opscode
deb-src http://apt.opscode.com/ ${distribution}-0.10 main #Opscode
EOS
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
sudo service chef-client stop &> /dev/null
