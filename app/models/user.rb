class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_default_avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.nickname = auth.info.nickname
      user.image = auth.info.image
      user.html_url = auth.extra.raw_info.html_url
      user.name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
