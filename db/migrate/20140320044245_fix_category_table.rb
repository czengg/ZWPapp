class FixCategoryTable < ActiveRecord::Migration
  def change
  	add_column :categories, :name, :string
  	remove_column :categories, :category_type
  end
end
