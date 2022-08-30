class AddDetailsToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :title, :string
    add_column :challenges, :content, :text
    add_column :challenges, :price_max, :integer
    add_column :challenges, :deadline, :date
  end
end
