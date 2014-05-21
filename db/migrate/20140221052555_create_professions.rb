class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :UserID
      t.string :Designation
      t.string :Company
      t.string :Job_From
      t.string :Job_To
      t.string :Private?

      t.timestamps
    end
  end
end
