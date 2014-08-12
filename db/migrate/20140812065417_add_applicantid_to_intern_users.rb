class AddApplicantidToInternUsers < ActiveRecord::Migration
  def change
    add_column :intern_users, :ApplicantID, :integer
  end
end
