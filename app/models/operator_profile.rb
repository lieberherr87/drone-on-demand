class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :images, dependent: :destroy
  mount_uploaders :images, ImageUploader
end
