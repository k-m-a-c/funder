class AddUrlSafeNameToRidings < ActiveRecord::Migration
  def change
    add_column :ridings, :url_safe_name, :string
  end
end
