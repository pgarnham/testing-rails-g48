class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :author
      t.datetime :created_at
      t.string :type

      t.timestamps
    end
  end
end
