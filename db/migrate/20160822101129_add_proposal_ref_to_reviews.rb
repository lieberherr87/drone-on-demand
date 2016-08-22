class AddProposalRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :proposal, foreign_key: true
  end
end
