package "zsh"
package "emacs23-nox"

user "root" do
  shell "/bin/zsh"
end

cookbook_file "/root/.zshrc.local" do
  source "dot-zshrc-local"
  action :create_if_missing
end
