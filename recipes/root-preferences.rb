if packages_include? "zsh"
  user "root" do
    shell "/bin/zsh"
  end
end

if packages_include? "emacs23-nox"
  cookbook_file "/root/.zshrc.local" do
    source "dot-zshrc-local"
    action :create_if_missing
  end
end
