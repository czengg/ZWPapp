class AddTagAssignmentIdToCategoryAssignments < ActiveRecord::Migration
  def change
    add_column :category_assignments, :tagAssignmentID, :int
  end
end
