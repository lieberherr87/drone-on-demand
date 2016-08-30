class ChangeDefaultOfStatusFromRequests < ActiveRecord::Migration[5.0]
  def change
    change_column_default :requests, :status, 0
  end
end
