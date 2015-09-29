class AddPhotoUrlToRidings < ActiveRecord::Migration
  def change
    add_column :ridings, :photo_url, :string
  end
end
