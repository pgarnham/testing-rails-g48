class AddRoomIdToOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :ofrezcos, :room_id, :integer
  end
end
