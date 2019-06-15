class AddTituloToMensajes < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :titulo, :string
  end
end
