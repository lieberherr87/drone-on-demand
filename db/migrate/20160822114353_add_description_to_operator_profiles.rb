class AddDescriptionToOperatorProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :operator_profiles, :description, :string
    add_column :operator_profiles, :skills, :string
  end
end
