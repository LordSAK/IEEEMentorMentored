class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_mentor_subjects

      t.timestamps
    end
  end
end
