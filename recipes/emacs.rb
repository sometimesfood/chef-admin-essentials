x_is_installed = 'dpkg --get-selections libx11-6 | grep -qE "[[:space:]]install$"'

package "emacs23-nox" do
  action :install
  not_if x_is_installed
end

package "emacs23" do
  action :install
  only_if x_is_installed
end
