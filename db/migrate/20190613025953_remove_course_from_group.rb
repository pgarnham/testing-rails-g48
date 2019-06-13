class RemoveCourseFromGroup < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :course, :string
  end
end
