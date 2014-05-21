class CreateVeterans < ActiveRecord::Migration
  def change
    create_table :veterans do |t|
      t.string :veteran_mentor_subjects

      t.timestamps
    end
  end
end
