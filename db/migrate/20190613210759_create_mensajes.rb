class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.integer :autor
      t.integer :receptor
      t.text :contenido

      t.timestamps
    end
  end
end
