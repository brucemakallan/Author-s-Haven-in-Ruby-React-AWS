class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :articles, class_name: 'Article', foreign_key: 'author_id'

  validates :first_name, presence: true, length: { within: 2..30 }
  validates :last_name, presence: true, length: { within: 2..30 }
end
