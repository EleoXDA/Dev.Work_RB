class AddOffersToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :offers, :challenge, foreign_key: true
  end
end
