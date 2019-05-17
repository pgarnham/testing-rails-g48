class AddRoomIdToOcupada < ActiveRecord::Migration[5.1]
  def change
    add_column :ocupadas, :room_id, :integer
  end
end
