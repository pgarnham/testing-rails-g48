class AddEventoIdToBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :buscos, :evento_id, :integer
  end
end
