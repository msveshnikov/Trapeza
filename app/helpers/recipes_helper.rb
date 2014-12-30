require "uri"

module RecipesHelper

  def images
    URI.extract(@recipe.Media.gsub(/\\/,""), /http(s)?|mailto/)
  end
end
