class CreateTreehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :treehouses do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price_per_night
      t.string :photo
      t.integer :beds
      t.integer :capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
