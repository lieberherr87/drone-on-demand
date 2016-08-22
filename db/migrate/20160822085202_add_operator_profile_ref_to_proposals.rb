class AddOperatorProfileRefToProposals < ActiveRecord::Migration[5.0]
  def change
    add_reference :proposals, :operator_profile, foreign_key: true
  end
end
