class AddPuntajeToProfesors < ActiveRecord::Migration[5.1]
  def change
    add_column :profesors, :puntaje, :integer
  end
end
