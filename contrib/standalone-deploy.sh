#!/bin/bash
GIT_SRC="http://github.com/sometimesfood/chef-admin-essentials.git"
COOKBOOK_DIR=`mktemp -d -t chef-admin-essentials.XXXXXX` || exit 1
cd ${COOKBOOK_DIR}
git clone ${GIT_SRC} admin-essentials
sudo chef-solo -c admin-essentials/contrib/standalone-config.rb
