class Location < ApplicationRecord
  has_many :article_locations
  has_many :articles, through: :article_locations

  has_many :subordinates, class_name: 'Location', foreign_key: 'attachment_id'

  belongs_to :attachment, class_name: 'Location', optional: true
end
