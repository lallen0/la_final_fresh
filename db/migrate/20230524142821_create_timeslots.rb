class CreateTimeslots < ActiveRecord::Migration[6.0]
  def change
    create_table :timeslots do |t|
      t.integer :court_id
      t.boolean :available
      t.date :date
      t.time :time
      t.integer :reserver_id
      t.datetime :reserved_at

      t.timestamps
    end
  end
end
