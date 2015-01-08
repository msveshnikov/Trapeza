class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :visits

  #default_scope -> { order('Rating DESC') }

  def self.search(query)
    query.gsub!(/['"%\\]/, "")
    query.strip!
    query   ="zzzzzzzaaazzzzz" if query.blank?
    query[0]=query[0].mb_chars.upcase
    ing     =Ingredient.where(Title: query).first
    s =""
    if ing
      s=" OR Ingredients LIKE '%\"id\":\"#{ing.id}\"%'"
    end
    where("TitleSearch like '%#{query.mb_chars.downcase}%'"+s)
  end

end
