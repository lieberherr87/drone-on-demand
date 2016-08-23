class RemoveDroneimagesFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :droneimages, :json
  end
end
