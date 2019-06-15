class AddLatitudToCampus < ActiveRecord::Migration[5.1]
  def change
    add_column :campus, :latitud, :float
  end
end
