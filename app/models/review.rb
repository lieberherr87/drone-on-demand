class Review < ApplicationRecord
  belongs_to :proposal

  validates :content, presence: true
  validates :rating, presence: true

end
