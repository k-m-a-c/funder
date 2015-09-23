class AddImportedUrlToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :imported_url, :string
  end
end
