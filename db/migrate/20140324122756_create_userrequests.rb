class CreateUserrequests < ActiveRecord::Migration
  def change
    create_table :userrequests do |t|
      t.string :RequestFrom
      t.string :RequestTo
      t.string :IsApproved
      t.string :SkillType

      t.timestamps
    end
  end
end
