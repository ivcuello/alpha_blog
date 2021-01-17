class Category < ApplicationRecord
  # Relations
  has_many :article_categories
  has_many :articles, :through => :article_categories

  # Validations
  validates :name, presence: true  
  validates :name, length: {minimum: 3, maximum: 25}
  validates :name, uniqueness: { case_sensitive: false }
end