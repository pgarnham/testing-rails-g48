class CreateAdministradors < ActiveRecord::Migration[5.1]
  def change
    create_table :administradors do |t|

      t.timestamps
    end
  end
end
