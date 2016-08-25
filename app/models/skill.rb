class Skill < ApplicationRecord
  has_many :operator_skills, dependent: :destroy
  validates :name, presence: :true
end
