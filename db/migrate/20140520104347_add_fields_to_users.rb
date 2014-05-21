class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :interest, :string
    add_column :users, :societies, :string
    add_column :users, :sector, :string
    add_column :users, :partnership, :string
  end
end
