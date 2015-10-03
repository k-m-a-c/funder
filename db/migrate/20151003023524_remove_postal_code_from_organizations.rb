class RemovePostalCodeFromOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :postal_code, :string
  end
end
