require 'json'

module RecipesHelper
  def steps
    JSON.parse(@recipe.Media)['photos']
  end

  def pic2(recipe)
    a = JSON.parse(recipe.Media)
    a['photos'].last['src_small']
  end

  def ingredients
    a = JSON.parse('[]')
    a = JSON.parse(@recipe.Ingredients) unless @recipe.Ingredients.blank?
    a.each do |e|
      b = e['childs']
      b.each do |l|
        l['type'] = Type.find(l['type']).title unless l['type'] == '0'
        l['type'] = '' if l['type'] == '0'
        l['id']   = Ingredient.find(l['id']).Title unless l['id'] == '0'
      end
    end
    a
  end
end
