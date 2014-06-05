class AddColumnsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :description, :string
    add_column :groups, :privacy, :string
  end
end
