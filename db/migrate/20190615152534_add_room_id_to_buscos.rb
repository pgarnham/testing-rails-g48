class AddRoomIdToBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :buscos, :room_id, :integer
  end
end
