class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 8 } if Rails.env.production?

  before_save { self.email = email.downcase }
end
