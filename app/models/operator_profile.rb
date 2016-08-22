class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :proposals
  has_many :reviews, through: :proposals, dependent: :destroy
  has_many :videos
  has_many :images
end
