class CreateOfrezcos < ActiveRecord::Migration[5.1]
  def change
    create_table :ofrezcos do |t|
      t.string :course
      t.datetime :start
      t.datetime :finish
      t.integer :user_id

      t.timestamps
    end
  end
end
