class AddAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :Account, :string
  end
end
