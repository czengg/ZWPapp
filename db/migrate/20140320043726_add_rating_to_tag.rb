class AddRatingToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :rating, :integer
  end
end
