package "molly-guard"

file "/etc/molly-guard/rc" do
  content "ALWAYS_QUERY_HOSTNAME=true\n"
end
