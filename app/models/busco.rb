class Busco < ApplicationRecord

  has_many :RelacionBuscos
  has_many :Users, through: :RelacionBuscos

end
