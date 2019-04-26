class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.string :author
      t.datetime :created_at
      t.float :reputation

      t.timestamps
    end
  end
end
