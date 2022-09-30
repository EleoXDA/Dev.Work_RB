class AddOffersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :offers, :user, foreign_key: true
  end
end
