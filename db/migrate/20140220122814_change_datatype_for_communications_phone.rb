class ChangeDatatypeForCommunicationsPhone < ActiveRecord::Migration
  def self.up
    change_table :communications do |t|
      t.change :Private?, :string
      t.change :Preferred, :string
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :Private?, :integer
      t.change :Preferred,:integer
    end
  end
end
