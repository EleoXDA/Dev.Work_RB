class AddPriceToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :price, :integer
    add_column :offers, :date, :date
  end
end
