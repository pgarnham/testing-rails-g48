class CreateOcupadas < ActiveRecord::Migration[5.1]
  def change
    create_table :ocupadas do |t|
      t.string :description
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
