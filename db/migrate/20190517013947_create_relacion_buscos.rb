class CreateRelacionBuscos < ActiveRecord::Migration[5.1]
  def change
    create_table :relacion_buscos do |t|
      t.integer :user_id
      t.integer :busco_id

      t.timestamps
    end
  end
end
