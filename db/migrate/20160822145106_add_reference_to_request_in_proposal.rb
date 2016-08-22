class AddReferenceToRequestInProposal < ActiveRecord::Migration[5.0]
  def change
    add_reference :proposals, :request, foreign_key: true
  end
end
