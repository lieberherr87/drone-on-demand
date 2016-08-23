class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :operator_skills
  has_many :skills, through: :operator_skills

  accepts_nested_attributes_for :skills

  mount_uploader :images, ImageUploader
end
