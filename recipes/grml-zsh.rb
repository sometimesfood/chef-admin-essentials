# add deb.grml.org apt repo sources
include_recipe "apt-repo::grml"

# make sure not to install anything but the packages we want
directory "/etc/apt/preferences.d"
cookbook_file "grml-pin" do
  path "/etc/apt/preferences.d/grml-pin"
  source "grml-pin"
  mode "0644"
end

package "grml-etc-core"

# only use screenrc_generic for now -- there's no grml-scripts-core package yet
grml_screenrcs = ["/etc/grml/screenrc", "/etc/grml/screenrc_grml"]
grml_screenrcs.each do | screenrc |
  file screenrc do
    action :nothing
    subscribes :delete, resources(:package => "grml-etc-core"), :immediately
  end
  link screenrc do
    to "/etc/grml/screenrc_generic"
  end
end
