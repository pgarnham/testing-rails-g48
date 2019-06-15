class AddUserIdToBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :buscos, :user_id, :integer
  end
end
