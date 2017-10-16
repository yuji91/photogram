class Picture < ActiveRecord::Base
  belongs_to :user
  #mount_uploader :picture, PictureUploader
  validates  :caption, length: { maximum: 140 }
end
