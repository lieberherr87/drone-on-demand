class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :videos
  has_many :images
end
