require 'bcrypt'

class User < ApplicationRecord
  include 'bcrypt'

  has_many :items

  validates :username, presence: true, uniqueness: true
  validates :email, :password_digest, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password ||= Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return nil if user.nil? || user.password != password
    user
  end
end
