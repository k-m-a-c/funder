class AddColorAndHighlightToMinistries < ActiveRecord::Migration
  def change
    add_column :ministries, :color, :string
    add_column :ministries, :highlight, :string
  end
end
