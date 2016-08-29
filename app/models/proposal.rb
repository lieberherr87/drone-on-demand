class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :review

  validates :price, presence: true
  validates :content, presence: true
  enum status: [:pending, :rejected, :accepted]
  #?
  #!
  #
  after_create :send_proposal_submitted_email

  private
    def send_proposal_submitted_email
      ProposalMailer.proposal_submitted(self).deliver_now
    end
end




