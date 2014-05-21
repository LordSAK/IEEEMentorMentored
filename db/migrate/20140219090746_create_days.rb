class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :days

      t.timestamps
    end
  end
end
