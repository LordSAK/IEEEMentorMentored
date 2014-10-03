class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.string :partnership

      t.timestamps
    end
  end
end
