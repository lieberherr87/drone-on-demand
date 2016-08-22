class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader


  has_many :proposals, dependent: :destroy
  has_many :reviews, through: :proposals
  has_one :operator_profile, dependent: :destroy
end
