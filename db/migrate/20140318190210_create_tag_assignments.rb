class CreateTagAssignments < ActiveRecord::Migration
  def change
    create_table :tag_assignments do |t|
      t.int :evidenceID
      t.int :tagID
      t.int :rating

      t.timestamps
    end
  end
end
