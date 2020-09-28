class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :treehouse, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
