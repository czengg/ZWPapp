class DeleteAttributeFromParagraph < ActiveRecord::Migration
  def change
  	remove_column :paragraphs, :report_id
  end
end
