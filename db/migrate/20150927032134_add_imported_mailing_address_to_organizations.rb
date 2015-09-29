class AddImportedMailingAddressToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :imported_mailing_address, :string
  end
end
