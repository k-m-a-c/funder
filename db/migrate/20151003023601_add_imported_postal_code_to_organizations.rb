class AddImportedPostalCodeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :imported_postal_code, :string
  end
end
