class Comment < ActiveRecord::Base
  #belongs_to :user
  belongs_to :recipe
  mount_uploader :picture, PictureUploader

  default_scope -> { order('created_at DESC') }

  #validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :content, length: { maximum: 500 }
end
