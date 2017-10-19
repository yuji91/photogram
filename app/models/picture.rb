class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates  :picture, presence: true
  validates  :caption, length: { maximum: 140 }
end
