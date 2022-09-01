class Addingcoordinates < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :latitude, :float
    add_column :challenges, :longitude, :float

  end
end
