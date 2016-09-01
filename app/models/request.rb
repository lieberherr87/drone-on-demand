class Request < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy

  CATEGORIES = %w(marketing event architectural)
  validates :location, presence: true
  validates :due_date, presence: true
  validates :category, inclusion: {in: CATEGORIES}
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  enum status: [:open, :closed]

  after_create :send_request_created_email

  def close
    self.closed!
    self.proposals.pending.each do |proposal|
      proposal.rejected!
    end
  end

  def created_by(user)
    user_id == user.id
  end

  private

  def send_request_created_email
    RequestMailer.request_created(self).deliver_now
  end
end
