#
# Cookbook Name:: chef-admin-essentials
# Recipe:: default
#
# Copyright (c) 2010 Sebastian Boehm. See LICENSE for details.
#

class Chef::Recipe
  include AdminEssentials
end

node.admin_essentials.all_packages.each do | a |
  package a
end

include_recipe 'admin-essentials::etckeeper'
include_recipe 'admin-essentials::ack'
include_recipe 'admin-essentials::mc'
include_recipe 'admin-essentials::ssh'
include_recipe 'admin-essentials::molly-guard'
include_recipe 'admin-essentials::grml-zsh'

if packages_include? "zsh"
  user "root" do
    shell "/bin/zsh"
  end
end
