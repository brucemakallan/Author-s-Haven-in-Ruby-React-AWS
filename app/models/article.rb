class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 2, maximum: 100 }
end
