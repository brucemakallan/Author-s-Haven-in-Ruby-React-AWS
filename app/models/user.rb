class User < ApplicationRecord
  has_secure_password

  has_many :articles, class_name: 'Article', foreign_key: 'author_id'

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { within: 2..30 }
  validates :last_name, presence: true, length: { within: 2..30 }
  validates :password, presence: true, length: { within: 6..30 }, confirmation: true
end
