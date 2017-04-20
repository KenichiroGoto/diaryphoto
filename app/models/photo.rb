class Photo < ActiveRecord::Base
  belongs_to :user

  validates :photo_title, presence: true
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader

end
