class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.integer :price
      t.integer :total_occupancy
      t.string :room_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
