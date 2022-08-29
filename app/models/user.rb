class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :challenges

  validates :nickname, :name, presence: true
end
