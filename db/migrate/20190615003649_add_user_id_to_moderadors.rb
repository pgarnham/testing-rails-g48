class AddUserIdToModeradors < ActiveRecord::Migration[5.1]
  def change
    add_column :moderadors, :user_id, :integer
  end
end
