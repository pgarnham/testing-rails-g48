class CreateContenidos < ActiveRecord::Migration[5.1]
  def change
    create_table :contenidos do |t|

      t.timestamps
    end
  end
end
