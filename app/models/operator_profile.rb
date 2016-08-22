class OperatorProfile < ApplicationRecord
  belongs_to :user


  has_many :proposals, dependent: :destroy
  has_many :reviews, through: :proposals

  has_many :videos, dependent: :destroy
  has_many :images, dependent: :destroy
end
