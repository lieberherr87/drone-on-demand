class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :review, dependent: :destroy

  validates :price, presence: true
  validates :content, presence: true
  monetize :price_cents
  enum status: [:pending, :rejected, :accepted, :paid]
  #?
  #!
  #
  after_create :send_proposal_submitted_email

    def accept
      self.accepted!
      self.request.close
    end

    def created_by(user)
      user_id == user.id
    end


  private

    def send_proposal_submitted_email
      ProposalMailer.proposal_submitted(self).deliver_now
    end


end




