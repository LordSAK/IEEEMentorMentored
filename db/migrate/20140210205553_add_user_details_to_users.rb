class AddUserDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_Type, :string
    add_column :users, :SkillType, :string
    add_column :users, :user_Need, :string
    add_column :users, :user_City, :string
    add_column :users, :user_State, :string
    add_column :users, :user_Zip, :string
    add_column :users, :SkillType1, :string
    add_column :users, :SkillNeed1, :string
    add_column :users, :SkillType2, :string
    add_column :users, :skillNeed2, :string
  end
end
