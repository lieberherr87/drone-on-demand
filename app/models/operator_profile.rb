class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :operator_skills, dependent: :destroy
  has_many :skills, through: :operator_skills
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :skills, :images

end
