class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :request

  enum status: [:pending, :rejected, :accepted]
  #?
  #!
  #
end

