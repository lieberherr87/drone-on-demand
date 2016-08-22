class RemoveReferencesToOperatorProfileInProposals < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :operator_profile_id
  end
end
