package "ack-grep"

# ack should link to ack-grep
link "/usr/bin/ack" do
  to "/usr/bin/ack-grep"
  not_if "which ack"
end
