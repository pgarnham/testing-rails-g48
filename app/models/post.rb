class Post < ApplicationRecord
  has_many :comments, :dependent => :destroy
  belongs_to :user
  acts_as_votable
  mount_uploader :image, ImageUploader
end
