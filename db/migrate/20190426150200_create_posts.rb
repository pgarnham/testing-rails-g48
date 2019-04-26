class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :created_at
      t.string :description
      t.float :reputation
      t.string :author

      t.timestamps
    end
  end
end
