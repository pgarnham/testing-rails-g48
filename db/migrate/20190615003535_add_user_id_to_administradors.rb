class AddUserIdToAdministradors < ActiveRecord::Migration[5.1]
  def change
    add_column :administradors, :user_id, :integer
  end
end
