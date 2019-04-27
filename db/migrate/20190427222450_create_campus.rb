class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.string :name
      t.string :location
      t.binary :map

      t.timestamps
    end
  end
end
