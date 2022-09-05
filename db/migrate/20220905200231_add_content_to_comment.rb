class AddContentToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :comment, :string
  end
end
