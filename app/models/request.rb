class Request < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy

  CATEGORIES = %w(marketing event architectural)
  validates :location, presence: true
  validates :due_date, presence: true
  validates :category, inclusion: {in: CATEGORIES}

  def applied_for?
    #is there a proposal for this request
    request.proposal
  end
end
