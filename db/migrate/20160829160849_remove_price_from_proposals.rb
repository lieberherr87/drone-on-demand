class RemovePriceFromProposals < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :price, :integer
  end
end
