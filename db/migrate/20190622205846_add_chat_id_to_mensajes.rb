class AddChatIdToMensajes < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :chat_id, :integer
  end
end
