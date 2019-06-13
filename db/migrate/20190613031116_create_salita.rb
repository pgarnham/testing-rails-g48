class CreateSalita < ActiveRecord::Migration[5.1]
  def change
    create_table :salita do |t|

      t.timestamps
    end
  end
end
