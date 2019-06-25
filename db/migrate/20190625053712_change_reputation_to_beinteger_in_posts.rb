class ChangeReputationToBeintegerInPosts < ActiveRecord::Migration[5.1]
   def change
    change_column :posts, :reputation, :integer
  end
end
