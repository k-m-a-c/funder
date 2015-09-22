class TransferPayment < ActiveRecord::Base
  belongs_to :organization
  belongs_to :ministry
end
