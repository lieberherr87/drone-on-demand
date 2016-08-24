class Image < ApplicationRecord
  belongs_to :operator_profile

  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
