class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :visits

  #default_scope -> { order('Rating DESC') }

  def self.search(query)
    where("lower(TitleSearch) like ?", "%#{query}%")
  end

end
