class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image, :string
    add_column :users, :html_url, :string
  end
end
