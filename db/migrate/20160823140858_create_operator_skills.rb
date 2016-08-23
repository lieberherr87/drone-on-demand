class CreateOperatorSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_skills do |t|
      t.references :operator_profile, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
