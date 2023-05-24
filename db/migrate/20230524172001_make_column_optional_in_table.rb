class MakeColumnOptionalInTable < ActiveRecord::Migration[6.0]
  def change
    change_column_null :timeslots, :reserver_id, true
  end
end
