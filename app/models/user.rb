class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_default_avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :challenges
  has_one_attached :photo

  validates :nickname, :name, presence: true
  def set_default_avatar
    return if photo.attached?

    path = "https://res.cloudinary.com/dp6zhyocx/image/upload/v1662046666/pqwya0pvqts4ubv0eqi6.jpg"
    file = URI.open(path)
    photo.attach(io: file, filename: "userphoto.png", content_type: "image/png")
    save
  end
end
