class AddDetailsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :price, :integer
    add_column :bookings, :date, :date
  end
end
