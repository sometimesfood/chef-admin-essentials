# packages to install
default.admin_essentials.packages = %w(
  mc
  htop
  strace
  screen
  inotify-tools
  debconf-utils
  rlwrap
  multitail
  vim
  zsh
  lsof
  less
  bc
  dc
  psmisc
  moreutils
  tree
  sudo
  dnsutils
  curl
  zip
  unzip
  aptitude
  iotop
  tmux
  keychain
  wakeonlan
  whois
  tcpdump
  nmap
  git-annex
  pwgen
  mg
)

# users to set admin preferences for (apart from root)
default.admin_essentials.admin_users = []
default.admin_essentials.admin_groups = []

# $EDITOR to set for admins, defaults to current $EDITOR (unless empty)
default.admin_essentials.editor =
  (ENV['EDITOR'].nil? || ENV['EDITOR'].empty?) ? 'emacs' : ENV['EDITOR']
