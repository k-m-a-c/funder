class CreateTransferPayments < ActiveRecord::Migration
  def change
    create_table :transfer_payments do |t|

      t.timestamps null: false
    end
  end
end
