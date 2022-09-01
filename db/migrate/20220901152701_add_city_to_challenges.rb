class AddCityToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :cities, :string
  end
end
