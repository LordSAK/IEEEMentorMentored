class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.integer :UserID
      t.string :CommunicationMode
      t.string :CommunicationDetail
      t.integer :Private?
      t.integer :Preferred

      t.timestamps
    end
    add_index :communications, [:UserID, :created_at]
  end
end
