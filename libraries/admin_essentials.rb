module AdminEssentials
  def packages_include?(p)
    return node.admin_essentials.all_packages.include? p
  end

  def include_recipe_relative(recipe)
    include_recipe "#{cookbook_name}::#{recipe}"
  end
end
