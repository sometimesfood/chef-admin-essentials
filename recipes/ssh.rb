directory "/root/.ssh"

cookbook_file "/root/.ssh/config" do
  source "dot-ssh-config"
  action :create_if_missing
end
