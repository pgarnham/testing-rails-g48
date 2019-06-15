class CreateEnchuves < ActiveRecord::Migration[5.1]
  def change
    create_table :enchuves do |t|
      t.integer :room_id

      t.timestamps
    end
  end
end
