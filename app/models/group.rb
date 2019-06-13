class Group < ApplicationRecord

  belongs_to :room
  belongs_to :course
  belongs_to :user
  has_many :GroupMembers
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

end
