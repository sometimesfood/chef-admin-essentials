package "etckeeper"
package "git-core"

cookbook_file "/etc/etckeeper/etckeeper.conf" do
  source "etckeeper.conf"
end
