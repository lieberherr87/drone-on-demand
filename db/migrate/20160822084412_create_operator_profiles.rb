class CreateOperatorProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_profiles do |t|
      t.string :company_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
