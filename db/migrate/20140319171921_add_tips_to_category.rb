class AddTipsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :tips, :string
  end
end
