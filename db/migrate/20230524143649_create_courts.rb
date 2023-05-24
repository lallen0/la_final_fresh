class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.integer :location_id
      t.integer :reservations_count

      t.timestamps
    end
  end
end
