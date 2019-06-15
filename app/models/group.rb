class Group < ApplicationRecord

  belongs_to :room
  belongs_to :course
  belongs_to :user
  has_many :GroupMembers, :dependent => :destroy
  has_many :Users, through: :GroupMembers

  def es_autor(usuario_actual)
      @ya_es_miembro = false
      GroupMember.all.each do |m|
        if m.user_id == usuario_actual
          @ya_es_miembro = true
        end
      end
      return @ya_es_miembro
    end

  def calcular_miembros
    @miembros = GroupMember.where(:group_id => self.id)
    return @miembros.length
  end

end
