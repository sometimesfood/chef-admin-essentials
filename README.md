chef-admin-essentials
=====================

Have a working admin environment. Fast.

Originally a straightforward Chef port of [andis' puppet-admin-essentials](http://github.com/andis/puppet-admin-essentials/).

Documentation
-------------

None so far. Yes, I know. I suck.

If you still want to give admin-essentials a spin, just install chef-solo and use the standalone deploy script:

    sudo aptitude install curl git-core
    bash < <( curl -s https://github.com/sometimesfood/chef-admin-essentials/raw/master/contrib/install-chef.sh )
    bash < <( curl -s https://github.com/sometimesfood/chef-admin-essentials/raw/master/contrib/standalone-deploy.sh )

Copyright
---------

Copyright (c) 2010 Sebastian Boehm. See LICENSE for details.
