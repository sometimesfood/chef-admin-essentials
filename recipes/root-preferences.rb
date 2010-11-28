package "zsh"
package "emacs23-nox"

user "root" do
  shell "/bin/zsh"
end

cookbook_file "/root/.zshrc.local" do
  source "dot-zshrc.local"
  action :create_if_missing
end

directory "/root/.ssh"
cookbook_file "/root/.ssh/config" do
  source "dot-ssh-config"
  action :create_if_missing
end

directory "/root/.mc"
cookbook_file "/root/.mc/ini" do
  source "dot-mc-ini"
end
