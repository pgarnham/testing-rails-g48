class CreateAuxiliars < ActiveRecord::Migration[5.1]
  def change
    create_table :auxiliars do |t|
      t.string :name

      t.timestamps
    end
  end
end
