class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader
  has_one :operator_profile, dependent: :destroy

  has_many :requests, dependent: :destroy
  has_many :pending_proposals, through: :requests, source: :proposals #All proposals on user's requests
  has_many :proposals, dependent: :destroy #Created by this user

end
