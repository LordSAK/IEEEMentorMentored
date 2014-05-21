class DropTable < ActiveRecord::Migration
  def change
  	drop_table :students
  	drop_table :entrepreneurs
  	drop_table :veterans
  end
end
