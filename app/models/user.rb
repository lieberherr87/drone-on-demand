class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true



  has_one :operator_profile, dependent: :destroy

  has_many :requests, dependent: :destroy
  has_many :pending_proposals, through: :requests, source: :proposals #All proposals on user's requests
  has_many :proposals, dependent: :destroy #Created by this user
  has_many :messages
  has_many :created_conversations, dependent: :destroy, foreign_key: :sender_id, class_name: 'Conversation'
  has_many :joined_conversations, dependent: :destroy, foreign_key: :recipient_id, class_name: 'Conversation'
  has_many :images, through: :operator_profiles
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :send_welcome_email
  after_create :create_op_profile, if: "self.pilot?"

  def not_applied?(request)
    self.proposals.find_by(request_id: request.id).nil?
  #is there a proposal from the current_user for a specific request
  end

  def create_op_profile
    self.create_operator_profile
  end

  def unread_messages?
    Message.unread.joins(:conversation).where("(conversations.sender_id = :id OR conversations.recipient_id = :id)", id: self.id).where.not(user_id: self.id).any?
  end

  private

  def send_welcome_email
    if self.pilot?
      UserMailer.welcome_pilot(self).deliver_now
    else
      UserMailer.welcome_client(self).deliver_now
    end
  end

end
