class CreateBuscos < ActiveRecord::Migration[5.1]
  def change
    create_table :buscos do |t|
      t.string :course
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
