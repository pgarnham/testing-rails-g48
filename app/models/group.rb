class Group < ApplicationRecord

  has_many :GroupMember
  has_many :User,
through :GroupMember
end
