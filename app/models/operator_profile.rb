class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :operator_skills, dependent: :destroy
  has_many :skills, through: :operator_skills
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :images, :videos, allow_destroy: true, reject_if: :all_blank

end

