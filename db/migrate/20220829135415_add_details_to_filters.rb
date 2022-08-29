class AddDetailsToFilters < ActiveRecord::Migration[7.0]
  def change
    add_column :filters, :name, :string
  end
end
