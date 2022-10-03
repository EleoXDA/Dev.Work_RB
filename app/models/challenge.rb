class Challenge < ApplicationRecord
  belongs_to :filter
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :photos

  validates :title, :content, :price_max, :deadline, :location, presence: true

  geocoded_by :location

  after_validation :geocode, if: :location
end
