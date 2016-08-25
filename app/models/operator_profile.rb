class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :operator_skills, dependent: :destroy
  has_many :skills, through: :operator_skills
  has_many :images, dependent: :destroy
<<<<<<< HEAD

  validates :description, presence: true
  validates :company_name, presence: true
=======
>>>>>>> 9cca575f441d5e889ce7f3039514ec47da4eba89
  accepts_nested_attributes_for :skills, :images, :videos

end

