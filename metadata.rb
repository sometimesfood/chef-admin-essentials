maintainer       "Sebastian Boehm"
maintainer_email "sebastian@sometimesfood.org"
license          "MIT"
description      "Install essential admin tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
#version          "0.1"
depends          "apt-repo"

recipe "admin-essentials",                    "Install essential admin tools"
recipe "admin-essentials::ack",               "Install ack"
recipe "admin-essentials::admin-preferences", "Set some preferences for root"
recipe "admin-essentials::emacs",             "Install emacs"
recipe "admin-essentials::etckeeper",         "Set up etckeeper"
recipe "admin-essentials::git",               "Set up git"
recipe "admin-essentials::grml-zsh",          "Set up grml console config"
recipe "admin-essentials::molly-guard",       "Set up molly-guard"

grouping "admin-essentials",
  :display_name => "admin-essentials",
  :description => "admin-essentials attribute settings",
  :type => "hash"

attribute "admin-essentials/packages",
  :display_name => "admin-essentials packages",
  :description => "admin packages to install",
  :type => "array",
  :calculated => true,
  :required => "optional"

attribute "admin-essentials/admin-users",
  :display_name => "admin-essentials admin users",
  :description => "users to set admin preferences for (apart from root)",
  :type => "array",
  :required => "optional"

attribute "admin-essentials/admin-groups",
  :display_name => "admin-essentials admin groups",
  :description => "groups to set admin preferences for (apart from root)",
  :type => "array",
  :required => "optional"

attribute "admin-essentials/admin-groups",
  :display_name => "admin-essentials editor",
  :description => "$EDITOR to set for admins",
  :type => "string",
  :calculated => true,
  :required => "optional"

%w(ubuntu debian).each do |os|
  supports os
end
