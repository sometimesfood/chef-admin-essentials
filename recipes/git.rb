package "git"

cookbook_file "/etc/gitconfig" do
  source "gitconfig"
  mode "0644"
end
