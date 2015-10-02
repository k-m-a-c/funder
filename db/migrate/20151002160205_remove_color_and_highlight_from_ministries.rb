class RemoveColorAndHighlightFromMinistries < ActiveRecord::Migration
  def change
    remove_column :ministries, :color, :string
    remove_column :ministries, :highlight, :string
  end
end
