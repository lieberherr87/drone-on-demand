class Proposal < ApplicationRecord
  belongs_to :operator_profile

  has_one :review, dependent: :destroy
end
