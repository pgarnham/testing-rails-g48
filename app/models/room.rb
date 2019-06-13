class Room < ApplicationRecord
  belongs_to :campu
  has_many :buscos, :dependent => :destroy
  has_many :groups, :dependent => :destroy
end
