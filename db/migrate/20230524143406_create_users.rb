class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :level
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.integer :reservations_count

      t.timestamps
    end
  end
end
