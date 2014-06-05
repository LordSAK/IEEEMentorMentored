class AddApprovalToGroupuser < ActiveRecord::Migration
  def change
    add_column :group_users, :approval, :string
  end
end
