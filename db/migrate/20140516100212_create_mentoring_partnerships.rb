class CreateMentoringPartnerships < ActiveRecord::Migration
  def change
    create_table :mentoring_partnerships do |t|
      t.string :Partnership

      t.timestamps
    end
  end
end
