x_is_installed = 'dpkg --get-selections xserver-xorg-core | grep -qE "[[:space:]]install$"'

package "emacs-nox" do
  action :install
  not_if x_is_installed
end

package "emacs" do
  action :install
  only_if x_is_installed
end
