class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  # Relations
  has_many :articles, dependent: :destroy

  # Validations
  has_secure_password
  
  # Non Null attributes
  validates :email, presence: true
  validates :username, presence: true
  
  # Attributes length
  validates :email, length: { maximum: 105 }
  validates :username, length: { minimum: 3, maximum: 25 }
  
  # Unique attributes
  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  # RegExp validations
  validates :email, format: { 
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: "Only allows a valid email format" 
  }
end