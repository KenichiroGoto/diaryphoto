class Photo < ActiveRecord::Base
  default_scope -> {order(updated_at: :desc)}

  belongs_to :user

  validates :photo_title, presence: true
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader

end
