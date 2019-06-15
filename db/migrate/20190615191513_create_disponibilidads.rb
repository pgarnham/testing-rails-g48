class CreateDisponibilidads < ActiveRecord::Migration[5.1]
  def change
    create_table :disponibilidads do |t|
      t.integer :room_id

      t.timestamps
    end
  end
end
