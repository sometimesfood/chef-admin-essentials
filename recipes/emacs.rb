x_is_installed = 'dpkg --get-selections xserver-xorg-core | grep -qE "[[:space:]]install$"'

package "emacs24-nox" do
  action :install
  not_if x_is_installed
end

package "emacs24" do
  action :install
  only_if x_is_installed
end
