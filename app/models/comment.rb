class Comment < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :challenge
end
