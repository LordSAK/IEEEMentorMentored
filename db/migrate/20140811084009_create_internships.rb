class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.string :Title
      t.string :Description
      t.string :Location
      t.integer :CompanyID

      t.timestamps
    end
  end
end
