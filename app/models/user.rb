class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :buscos
  has_many :posts
  has_many :comments
  has_many :GroupMembers
  has_many :ofrezcos
  has_many :RelacionBuscos
  has_many :buscos, through: :RelacionBuscos
  has_many :groups, through: :GroupMembers

  def actualizar_rol(rol_nuevo)
    self.update(rol: rol_nuevo)
  end

  def obtener_mis_cursos(id_actual)
    @mis_inscritos = Alumno.where(:user_id => id_actual)
    @mis_cursos = []
    @mis_inscritos.each do |insc|
      @mis_cursos << Course.find(insc.course_id)
    end
    return @mis_cursos
  end


  #attr_accessible :first_name, :last_name
  #validates_presence_of :first_name, :last_name
end
