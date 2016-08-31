class AddStatusToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :status, :integer
  end
end
