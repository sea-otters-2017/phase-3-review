class User < ApplicationRecord
  has_secure_password
  has_many :auctions
  has_many :bids

  validates :username, :password_digest, :email,  presence: true
  validates :username, :email, uniqueness: true
end
