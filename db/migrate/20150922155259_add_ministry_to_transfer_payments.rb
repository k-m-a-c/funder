class AddMinistryToTransferPayments < ActiveRecord::Migration
  def change
    add_reference :transfer_payments, :ministry, index: true, foreign_key: true
  end
end
