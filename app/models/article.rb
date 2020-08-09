class Article < ApplicationRecord
  has_many :comments, as: :commentable

  has_many :article_locations
  has_many :locations, through: :article_locations

  accepts_nested_attributes_for :locations, allow_destroy: true
end
