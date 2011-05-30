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
package "grml-scripts-core"
