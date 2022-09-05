class RemoveReviewFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :review
  end
end
