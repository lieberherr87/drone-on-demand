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
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def applied_for?(request)
    self.proposals.find_by(request_id: request.id).nil?
  #is there a proposal from the current_user for a specific request
  end

  after_create :create_op_profile, if: "self.pilot?"

  def create_op_profile
    self.create_operator_profile
  end

end
