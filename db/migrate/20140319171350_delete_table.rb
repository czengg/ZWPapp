class DeleteTable < ActiveRecord::Migration
   def down
    drop_table :category_assignments
  end
end
