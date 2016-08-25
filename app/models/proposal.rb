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
end




