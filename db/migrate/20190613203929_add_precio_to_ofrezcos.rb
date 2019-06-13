class AddPrecioToOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :ofrezcos, :precio, :integer
  end
end
