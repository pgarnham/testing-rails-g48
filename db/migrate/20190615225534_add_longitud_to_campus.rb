class AddLongitudToCampus < ActiveRecord::Migration[5.1]
  def change
    add_column :campus, :longitud, :float
  end
end
