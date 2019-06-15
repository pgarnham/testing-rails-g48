class Busco < ApplicationRecord

  has_many :RelacionBuscos, :dependent => :destroy
  has_many :users, through: :RelacionBuscos

  def es_autor_busco(usuario_actual)
      @ya_es_buscador = false
      RelacionBusco.all.each do |m|
        if m.user_id == usuario_actual
          @ya_es_buscador = true
        end
      end
      return @ya_es_buscador
    end

  def calcular_buscadores
    @buscadores = RelacionBusco.where(:busco_id => self.id)
    return @buscadores.length
  end

end
