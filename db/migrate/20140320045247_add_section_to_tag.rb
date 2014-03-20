class AddSectionToTag < ActiveRecord::Migration
  def change
    add_column :tags, :section, :string
  end
end
