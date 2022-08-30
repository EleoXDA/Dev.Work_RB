class Challenge < ApplicationRecord
  belongs_to :filter
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :content, :price_max, :deadline, presence: true
end