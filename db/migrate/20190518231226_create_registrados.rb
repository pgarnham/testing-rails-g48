class CreateRegistrados < ActiveRecord::Migration[5.1]
  def change
    create_table :registrados do |t|

      t.timestamps
    end
  end
end
