class DropViewFromSchema < ActiveRecord::Migration
  def change
    drop_view :searches
  end
end
