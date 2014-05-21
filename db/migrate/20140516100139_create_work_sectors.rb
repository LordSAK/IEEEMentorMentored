class CreateWorkSectors < ActiveRecord::Migration
  def change
    create_table :work_sectors do |t|
      t.string :Sector

      t.timestamps
    end
  end
end
