if packages_include? "etckeeper"
  cookbook_file "/etc/etckeeper/etckeeper.conf" do
    source "etc-etckeeper-etckeeper.conf"
  end
end
