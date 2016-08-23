class AddDroneimagesToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :droneimages, :json
  end
end
