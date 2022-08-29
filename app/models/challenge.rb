class Challenge < ApplicationRecord
  belongs_to :filter
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
