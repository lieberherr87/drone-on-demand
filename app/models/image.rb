class Image < ApplicationRecord
  belongs_to :operator_profile
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
