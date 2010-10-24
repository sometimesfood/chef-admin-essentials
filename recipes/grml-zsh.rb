keyserver = "subkeys.pgp.net"
grml_key_id = "ECDEA787"
grml_key_installed = "apt-key list | grep #{grml_key_id}"

execute "apt-key adv --keyserver #{keyserver} --recv-keys #{grml_key_id}" do
  not_if grml_key_installed
end

directory "/etc/apt/sources.list.d"

cookbook_file "grml.list" do
  path "/etc/apt/sources.list.d/grml.list"
  source "etc-apt-sources-list-d-grml-list"
  mode "0644"
end

execute "aptitude update" do
  action :nothing
  subscribes :run, resources(:cookbook_file => "grml.list"), :immediately
end

directory "/etc/apt/preferences.d"

cookbook_file "grml-pin" do
  path "/etc/apt/preferences.d/grml-pin"
  source "etc-apt-preferences.d-grml-pin"
  mode "0644"
end

package "grml-etc-core"
package "grml-debian-keyring"

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
