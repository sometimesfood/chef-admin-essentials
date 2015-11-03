include_recipe_relative "git"

package "etckeeper" do
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
end

cookbook_file "/etc/etckeeper/etckeeper.conf" do
  source "etckeeper.conf"
end
