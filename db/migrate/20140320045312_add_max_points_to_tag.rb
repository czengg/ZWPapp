class AddMaxPointsToTag < ActiveRecord::Migration
  def change
    add_column :tags, :max_points, :int
  end
end
