class AddCompnaynameAltSelectorTimerangeToUser < ActiveRecord::Migration
  def change
    add_column :users, :CompanyName, :string
    add_column :users, :AlternateName, :string
    add_column :users, :Selector, :string
    add_column :users, :From, :string
    add_column :users, :To, :string
  end
end
