class AddCourseIdToBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :buscos, :course_id, :integer
  end
end
