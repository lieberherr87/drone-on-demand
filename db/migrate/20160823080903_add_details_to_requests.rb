class AddDetailsToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :details, :string
  end
end
