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

include_recipe_relative 'etckeeper'
include_recipe_relative 'ack'
include_recipe_relative 'molly-guard'
include_recipe_relative 'grml-zsh'
include_recipe_relative 'emacs'
include_recipe_relative 'admin-preferences'
include_recipe_relative 'git'
