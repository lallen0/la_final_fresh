class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :description
      t.integer :courts_count

      t.timestamps
    end
  end
end
