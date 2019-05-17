class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|

      t.timestamps
    end
  end
end
