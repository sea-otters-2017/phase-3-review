class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids

  validates :name, :description, :condition, :start, :end, presence: true

end
