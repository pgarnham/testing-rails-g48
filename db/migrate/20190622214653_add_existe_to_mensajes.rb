class AddExisteToMensajes < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :existe, :integer
  end
end
