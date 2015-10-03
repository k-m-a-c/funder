class AddImportedRidingNameToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :imported_riding_name, :string
  end
end
