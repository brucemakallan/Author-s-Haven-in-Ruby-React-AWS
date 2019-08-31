class User < ApplicationRecord
  has_many :articles, class_name: 'Article', foreign_key: 'author_id'

  validates :first_name, presence: true, length: { within: 2..30 }
  validates :last_name, presence: true, length: { within: 2..30 }
end
