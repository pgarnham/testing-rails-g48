class Course < ApplicationRecord
  has_many :groups
  has_many :buscos
end
