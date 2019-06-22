class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.integer :primero
      t.integer :segundo

      t.timestamps
    end
  end
end
