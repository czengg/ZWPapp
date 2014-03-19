class Delete < ActiveRecord::Migration
  def up
    drop_table :category_assignments
  end

  def down
  	create_table :category_assignments do |t|
	  	t.integer  :categoryID
	    t.datetime :created_at
	    t.datetime :updated_at
	    t.integer  :tagAssignmentID
	    t.timestamps
	end
  end
end
