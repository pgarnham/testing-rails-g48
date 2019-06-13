class RemoveCourseFromOfrezcos < ActiveRecord::Migration[5.1]
  def change
    remove_column :ofrezcos, :course, :string
  end
end
