class ChangeUserreqestTable < ActiveRecord::Migration
  def change
  	change_column :userrequests,:RequestFrom, :integer # USING CAST("RequestFrom" AS integer)'
  	change_column :userrequests,:RequestTo, :integer #USING CAST("RequestTo" AS integer)'
  end
end
