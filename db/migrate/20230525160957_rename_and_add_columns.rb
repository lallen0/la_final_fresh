class RenameAndAddColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :timeslots, :start_time, :datetime
    add_column :timeslots, :end_time, :datetime
  end
end
