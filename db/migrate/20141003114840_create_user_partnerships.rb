class CreateUserPartnerships < ActiveRecord::Migration
  def change
    create_table :user_partnerships do |t|
      t.integer :user_id
      t.integer :parternshipvalue

      t.timestamps
    end
  end
end
