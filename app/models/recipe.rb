class Recipe < ActiveRecord::Base
  belongs_to :category

  #default_scope -> { order('Rating DESC') }

  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("lower(TitleSearch) like ?", "%#{query}%")
  end

end
