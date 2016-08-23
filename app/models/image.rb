class Image < ApplicationRecord
  belongs_to :operator_profile
  validates :url, presence: true
  mount_uploader :droneimages, ImageUploader
end
