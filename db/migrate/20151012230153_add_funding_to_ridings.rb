class AddFundingToRidings < ActiveRecord::Migration
  def change
    add_column :ridings, :funding, :integer, limit: 8
  end
end
