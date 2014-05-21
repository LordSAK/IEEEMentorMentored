class FixColumnNameinUser < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :First_Name
  end
end
