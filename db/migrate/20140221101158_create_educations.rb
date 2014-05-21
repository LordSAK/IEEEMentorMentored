class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :UserID
      t.string :SchoolName
      t.string :SchoolFrom
      t.string :SchoolTo
      t.string :Private?

      t.timestamps
    end
  end
end
