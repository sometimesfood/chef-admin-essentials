module AdminEssentials
  def packages_include?(p)
    return node.admin_essentials.all_packages.include? p
  end
end
