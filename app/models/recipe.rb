class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :visits

  scope :post, ->(onlypost) { onlypost ? (where IsNew: 0) : all }

  def self.search(query)
    query.gsub!(/['"%\\]/, '')
    query.strip!
    query    = 'zzzzzzzaaazzzzz' if query.blank?
    query[0] = query[0].mb_chars.upcase
    ing      = Ingredient.where(Title: query).first
    s        = ''
    if ing
      s = " OR Ingredients LIKE '%\"id\":\"#{ing.id}\"%'"
    end
    where("TitleSearch like '%#{query.mb_chars.downcase}%'" + s)
  end

  def self.check
    puts 'Doing hard work'
    Recipe.all.each do |recipe|
      if !recipe.Ingredients || recipe.Ingredients.blank?
        next
      end
      a = JSON.parse(recipe.Ingredients)
      unsafe = recipe.IsNew
      a.each do |e|
        b = e['childs']
        b.each do |l|
          if Ingredient.find(l['id']).Gramm == 1
            unsafe = 1
          end
        end
      end
      recipe.IsNew = unsafe
      recipe.save!
    end
    puts 'End hard work'
  end
end
