class Chatroom < ApplicationRecord
  belongs_to :challenge
  has_many :comments
end
