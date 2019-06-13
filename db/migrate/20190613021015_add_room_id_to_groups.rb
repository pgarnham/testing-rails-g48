class AddRoomIdToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :room_id, :integer
  end
end
