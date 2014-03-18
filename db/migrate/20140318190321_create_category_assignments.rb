class CreateCategoryAssignments < ActiveRecord::Migration
  def change
    create_table :category_assignments do |t|
      t.integer :tagID
      t.integer :categoryID

      t.timestamps
    end
  end
end
