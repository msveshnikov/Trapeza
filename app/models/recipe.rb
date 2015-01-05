class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :visits

  #default_scope -> { order('Rating DESC') }

  def self.search(query)
    query.gsub!(/['"%\\]/,"")
    ing=Ingredient.where(Title: query.strip).first
    s=""
    if !ing.blank?
      s=" OR Ingredients LIKE '%\"id\":\"#{ing.id}\"%'"
    end
    where("TitleSearch like '%#{query.strip.mb_chars.downcase}%'"+s)
  end

end
