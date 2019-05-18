class CreateModeradors < ActiveRecord::Migration[5.1]
  def change
    create_table :moderadors do |t|

      t.timestamps
    end
  end
end
