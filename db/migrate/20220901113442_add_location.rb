class AddLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :location, :string
  end
end
