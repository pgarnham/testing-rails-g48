class Course < ApplicationRecord
  has_many :groups, :dependent => :destroy
  has_many :buscos, :dependent => :destroy
  has_many :ofrezcos, :dependent => :destroy
  has_many :profesors, :dependent => :destroy
  has_many :alumnos, :dependent => :destroy 
end
