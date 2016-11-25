class Movie < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates_presence_of :picture
  validates_integrity_of :picture
  validates_processing_of :picture
end
