package "git-core"
package "etckeeper"

cookbook_file "/etc/etckeeper/etckeeper.conf" do
  source "etckeeper.conf"
end

# initialize etckeeper if /etc is not already a git repository
execute "etckeeper init" do
  not_if { File.exists? "/etc/.git" }
end

# commit /etc if we have just initialized etckeeper
execute "etckeeper commit 'Initial commit, triggered by chef-admin-essentials'" do
  action :nothing
  subscribes :run, resources(:execute => "etckeeper init"), :immediately
end
