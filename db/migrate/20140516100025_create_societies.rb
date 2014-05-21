class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :IEEESocieties

      t.timestamps
    end
  end
end
