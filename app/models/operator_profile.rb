class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :images, dependent: :destroy
end
