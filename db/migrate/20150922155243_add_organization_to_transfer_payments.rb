class AddOrganizationToTransferPayments < ActiveRecord::Migration
  def change
    add_reference :transfer_payments, :organization, index: true, foreign_key: true
  end
end
