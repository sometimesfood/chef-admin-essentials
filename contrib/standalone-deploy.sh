#!/bin/bash
ADMIN_ESSENTIALS="http://github.com/sometimesfood/chef-admin-essentials.git"
APT_REPO="http://github.com/sometimesfood/chef-apt-repo.git"
COOKBOOK_DIR=`mktemp -d -t chef-admin-essentials.XXXXXX` || exit 1
cd ${COOKBOOK_DIR}
git clone ${ADMIN_ESSENTIALS} admin-essentials
git clone ${APT_REPO} apt-repo
sudo EDITOR="${EDITOR}" chef-solo -c admin-essentials/contrib/standalone-config.rb
