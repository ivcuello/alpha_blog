class Article < ApplicationRecord
  # Relations
  belongs_to :user
  
  # Non Null Validations
  validates :title, presence: true
  validates :description, presence: true

  # Article length validations
  validates :title, length: { minimum: 6, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 300 }
end
