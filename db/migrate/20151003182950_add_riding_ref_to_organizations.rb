class AddRidingRefToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :riding, index: true, foreign_key: true
  end
end
