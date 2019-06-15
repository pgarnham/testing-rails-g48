class SolAdmin < ApplicationRecord
  def hasta_luego(lista)
    lista.each do |l|
      l.destroy
    end
  end
end
