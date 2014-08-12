class CreateInternUsers < ActiveRecord::Migration
  def change
    create_table :intern_users do |t|
      t.string :resume_path
      t.integer :internship_id

      t.timestamps
    end
  end
end
