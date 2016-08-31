class AddPaymentToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :payment, :json
  end
end
