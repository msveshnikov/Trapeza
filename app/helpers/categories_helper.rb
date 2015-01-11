module CategoriesHelper
  def pic(category)
    recipe=category.recipes.first
    recipe=category.keyword_recipes.first if category.keywords
    a=JSON.parse(recipe.Media) if recipe
    return a["photos"].last["src_small"] if recipe
  end
end
