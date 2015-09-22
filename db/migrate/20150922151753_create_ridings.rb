class CreateRidings < ActiveRecord::Migration
  def change
    create_table :ridings do |t|
      t.string :name
      t.string :city

      t.timestamps null: false
    end
  end
end
