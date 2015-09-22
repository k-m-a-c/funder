class AddAmountToTransferPayment < ActiveRecord::Migration
  def change
    add_column :transfer_payments, :amount, :integer, limit: 8
  end
end
