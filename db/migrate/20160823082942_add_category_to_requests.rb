class AddCategoryToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :category, :string
  end
end
