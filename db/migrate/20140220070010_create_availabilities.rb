class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :UserID
      t.string :UserDays
      t.string :TimeFrom
      t.string :TimeTo

      t.timestamps
    end
    add_index :availabilities, [:UserID,:created_at]
  end
end
