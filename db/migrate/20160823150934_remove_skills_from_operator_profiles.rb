class RemoveSkillsFromOperatorProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :operator_profiles, :skills, :string
  end
end
