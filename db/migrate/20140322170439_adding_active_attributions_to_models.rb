class AddingActiveAttributionsToModels < ActiveRecord::Migration
  def change
  	add_column :companies, :active, :boolean
  	add_column :evidences, :active, :boolean
  	add_column :tag_assignments, :active, :boolean
  	add_column :categories, :active, :boolean
  	add_column :tags, :active, :boolean
  end
end
