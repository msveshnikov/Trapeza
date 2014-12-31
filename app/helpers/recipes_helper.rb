require 'json'

module RecipesHelper
  def array
    JSON.parse(@recipe.Media)["photos"]
  end
end
