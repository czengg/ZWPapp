class RemoveTagIdToCategoryAssignments < ActiveRecord::Migration
  def change
    remove_column :category_assignments, :tagID, :int
  end
end
