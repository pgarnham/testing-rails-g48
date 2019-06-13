class CreateSolModeradors < ActiveRecord::Migration[5.1]
  def change
    create_table :sol_moderadors do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
