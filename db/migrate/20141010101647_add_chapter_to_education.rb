class AddChapterToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :Chapter, :integer
  end
end
