class AddUserIdToOcupadas < ActiveRecord::Migration[5.1]
  def change
    add_column :ocupadas, :user_id, :integer
  end
end
