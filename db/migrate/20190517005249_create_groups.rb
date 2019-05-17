class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :course
      t.integer :capacity
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
