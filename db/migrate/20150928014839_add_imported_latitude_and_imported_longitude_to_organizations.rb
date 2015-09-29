class AddImportedLatitudeAndImportedLongitudeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :imported_latitude, :float
    add_column :organizations, :imported_longitude, :float
  end
end
