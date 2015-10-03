class AddPostalCodeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :postal_code, :string
  end
end
