default.admin_essentials.additional_packages = %w()
default.admin_essentials.default_packages = %w(
  mc
  htop
  strace
  screen
  inotify-tools
  debconf-utils
  rlwrap
  zsh
  multitail
  git-core
  emacs23-nox
  vim
  etckeeper
  molly-guard
  lsof
  less
  bc
  dc
  psmisc
  tcpdump
  moreutils
  ack-grep
  tree
  sudo
  dnsutils
)

default.admin_essentials.all_packages =
  default.admin_essentials.default_packages +
  default.admin_essentials.additional_packages
