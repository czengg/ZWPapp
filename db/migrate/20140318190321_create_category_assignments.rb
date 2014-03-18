class CreateCategoryAssignments < ActiveRecord::Migration
  def change
    create_table :category_assignments do |t|
      t.int :tagID
      t.int :categoryID

      t.timestamps
    end
  end
end
