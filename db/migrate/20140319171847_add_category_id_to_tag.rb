class AddCategoryIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :categoryID, :int
  end
end
