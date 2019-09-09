class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { within: 2..100 }
end
