class AddColumnPrivateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Private, :string
  end
end
