module AdminEssentials
  def include_recipe_relative(recipe)
    include_recipe "#{cookbook_name}::#{recipe}"
  end
end
