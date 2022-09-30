class Offer < ApplicationRecord
  belongs_to :challenge
  belongs_to :user

  validates :date, :price, presence: true
end
