class RemoveImagesFromOperatorProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :operator_profiles, :images, :json
  end
end
