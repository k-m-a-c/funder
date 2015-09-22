class Organization < ActiveRecord::Base
  has_many :transfer_payments
  has_many :ministries, through: :transfer_payments
end
