class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments
  has_many :articles, through: :comments, source_type: 'Article', source: :commentable
  has_many :videos, through: :comments, source_type: 'Video', source: :commentable
end
