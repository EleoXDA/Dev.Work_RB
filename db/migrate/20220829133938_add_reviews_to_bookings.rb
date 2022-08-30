class AddReviewsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :review, :string
  end
end
