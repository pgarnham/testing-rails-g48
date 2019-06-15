class AddLimitToBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :buscos, :limit, :integer
  end
end
