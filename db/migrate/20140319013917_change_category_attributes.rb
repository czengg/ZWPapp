class ChangeCategoryAttributes < ActiveRecord::Migration
  def change
  	add_column :categories, :description, :string
  	add_column :categories, :category_type, :integer
  	remove_column :categories, :name
  end
end
