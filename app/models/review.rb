class Review < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
end
