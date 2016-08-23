class AddImagesToOperatorprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :operator_profiles, :images, :json
  end
end
