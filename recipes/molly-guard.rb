if packages_include? "molly-guard"
  file "/etc/molly-guard/rc" do
    content "ALWAYS_QUERY_HOSTNAME=true\n"
  end
end
