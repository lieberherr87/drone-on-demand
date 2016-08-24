class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :price, presence: true
  validates :content, presence: true
  enum status: [:pending, :rejected, :accepted]
  #?
  #!
  #
end




