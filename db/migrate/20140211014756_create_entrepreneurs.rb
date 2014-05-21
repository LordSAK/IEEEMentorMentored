class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.string :entrepreneurs_mentor_subjects

      t.timestamps
    end
  end
end
