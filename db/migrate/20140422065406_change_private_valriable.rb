class ChangePrivateValriable < ActiveRecord::Migration
  def change
  	rename_column :professions, :Private?, :Private
  	rename_column :educations, :Private?, :Private
  	rename_column :communications, :Private?, :Private
  end
end
