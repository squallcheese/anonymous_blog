class Post < ActiveRecord::Base

  validates :post_title, :presence => true
  validates :post_text, :presence => true
  validates :post_author, :presence => true

  has_many :posts_tags
  has_many :tags, through: :posts_tags

end
