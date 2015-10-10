include_recipe_relative "git"

package "etckeeper"

cookbook_file "/etc/etckeeper/etckeeper.conf" do
  source "etckeeper.conf"
end
