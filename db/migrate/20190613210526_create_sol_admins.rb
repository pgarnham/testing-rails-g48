class CreateSolAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :sol_admins do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
