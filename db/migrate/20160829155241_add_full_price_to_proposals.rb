class AddFullPriceToProposals < ActiveRecord::Migration[5.0]
  def change
    add_monetize :proposals, :price, currency: { present: false }
  end
end
