class AddCourseIdToOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :ofrezcos, :course_id, :integer
  end
end
