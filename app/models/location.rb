class Location < ApplicationRecord
  belongs_to :article, optional: true

  has_many :subordinates, class_name: 'Location', foreign_key: 'attachment_id'

  belongs_to :attachment, class_name: 'Location', optional: true
end
