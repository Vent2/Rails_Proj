class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :rave_id
      t.integer :artist_id
      t.integer :stage_number

      t.timestamps
    end
  end
end
