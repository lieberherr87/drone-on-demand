class OperatorProfile < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :proposals
  has_many :videos
  has_many :images
end
