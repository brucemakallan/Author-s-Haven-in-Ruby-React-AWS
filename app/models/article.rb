class Article < ApplicationRecord
  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 2, maximum: 100 }
end
