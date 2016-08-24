class Skill < ApplicationRecord
  has_many :operator_skills, dependent: :destroy
end
