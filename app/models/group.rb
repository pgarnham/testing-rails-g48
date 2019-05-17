class Group < ApplicationRecord

  has_many :GroupMembers
  has_many :Users, through: :GroupMembers
end
