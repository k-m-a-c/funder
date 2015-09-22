class Ministry < ActiveRecord::Base
  has_many :transfer_payments
  has_many :organizations, through: :transfer_payments
end
