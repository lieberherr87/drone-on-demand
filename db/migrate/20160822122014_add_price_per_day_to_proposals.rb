class AddPricePerDayToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :price_per_day, :float
  end
end
