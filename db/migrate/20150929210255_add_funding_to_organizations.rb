class AddFundingToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :funding, :integer, limit: 8
  end
end
