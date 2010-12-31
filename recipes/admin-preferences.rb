include_recipe_relative 'emacs'

package "zsh"

admin_users = node.admin_essentials.admin_users

# add all members of groups in admin_groups to admin list
node.admin_essentials.admin_groups.each do |admin_group|
  group_members = node[:etc][:group][admin_group][:members]
  admin_users += group_members
end

# add SUDO_USER to admin list if there were no other admins specified
sudo_user = ENV['SUDO_USER']
if sudo_user && admin_users.empty?
  admin_users << sudo_user
end

# always set admin preferences for root
admin_users << "root"
admin_users.uniq!

admin_users.each do |username|
  admin = node[:etc][:passwd][username]

  user username do
    shell "/bin/zsh"
  end

  template "#{admin[:dir]}/.zshrc.local" do
    source "dot-zshrc.local.erb"
    action :create_if_missing
    owner admin[:uid]
    group admin[:gid]
  end

  # silence zsh-newuser-install
  file "#{admin[:dir]}/.zshrc" do
    action :create
    owner admin[:uid]
    group admin[:gid]
  end

  directory "#{admin[:dir]}/.ssh" do
    owner admin[:uid]
    group admin[:gid]
  end

  cookbook_file "#{admin[:dir]}/.ssh/config" do
    source "dot-ssh-config"
    action :create_if_missing
    owner admin[:uid]
    group admin[:gid]
  end

  directory "#{admin[:dir]}/.mc" do
    owner admin[:uid]
    group admin[:gid]
  end

  cookbook_file "#{admin[:dir]}/.mc/ini" do
    source "dot-mc-ini"
    owner admin[:uid]
    group admin[:gid]
  end

  cookbook_file "#{admin[:dir]}/.gitconfig" do
    source "dot-gitconfig"
    action :create_if_missing
    owner admin[:uid]
    group admin[:gid]
  end
end
