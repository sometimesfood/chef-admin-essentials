maintainer       "Sebastian Boehm"
maintainer_email "sebastian@sometimesfood.org"
license          "MIT"
description      "Install essential admin tools"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
#version          "0.1"
depends          "apt-repo"

recipe "admin-essentials",                   "Install essential admin tools"
recipe "admin-essentials::ack",              "Install ack"
recipe "admin-essentials::etckeeper",        "Set up etckeeper"
recipe "admin-essentials::grml-zsh",         "Set up grml console config"
recipe "admin-essentials::mc",               "Set up midnight commander"
recipe "admin-essentials::molly-guard",      "Set up molly-guard"
recipe "admin-essentials::root-preferences", "Set some preferences for root"

%w(ubuntu debian).each do |os|
  supports os
end
