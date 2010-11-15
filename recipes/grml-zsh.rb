include_recipe "chef-apt-repo::grml"

directory "/etc/apt/preferences.d"
cookbook_file "grml-pin" do
  path "/etc/apt/preferences.d/grml-pin"
  source "etc-apt-preferences.d-grml-pin"
  mode "0644"
end

package "grml-etc-core"

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
