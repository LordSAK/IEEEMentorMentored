class AddLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Last_Name, :string
  end
end
