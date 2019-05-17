class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :GroupMembers
  has_many :Groups, through: :GroupMembers
  has_many :RelacionBuscos
  has_many :Buscos, through: :RelacionBuscos

  #attr_accessible :first_name, :last_name
  #validates_presence_of :first_name, :last_name
end
