class AddCoordinatesToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :latitude, :float
    add_column :requests, :longitude, :float
  end
end
