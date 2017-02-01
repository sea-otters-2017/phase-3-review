require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  # has_many :items
  validates :username, presence: true, uniqueness: true
  validates :email, :password_digest, presence: true

end
