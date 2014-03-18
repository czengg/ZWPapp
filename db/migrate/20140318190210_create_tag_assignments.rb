class CreateTagAssignments < ActiveRecord::Migration
  def change
    create_table :tag_assignments do |t|
      t.integer :evidenceID
      t.integer :tagID
      t.integer :rating

      t.timestamps
    end
  end
end
