class ChangeProfessionsTable < ActiveRecord::Migration
  def change
  	change_column :professions,:UserID, :integer #USING CAST("UserID" AS integer)'
  	change_column :educations,:UserID, :integer #USING CAST("UserID" AS integer)'
  end
end
