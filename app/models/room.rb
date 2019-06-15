class Room < ApplicationRecord
  belongs_to :campu
  has_many :buscos, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :ofrezcos, :dependent => :destroy
  has_many :ocupadas, :dependent => :destroy
end
