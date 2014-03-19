class ChangeIdSyntaxInForeignKeys < ActiveRecord::Migration
  def change
  	add_column :projects, :company_id, :integer
  	add_column :clients, :company_id, :integer
  	add_column :evidences, :project_id, :integer
  	add_column :tag_assignments, :evidence_id, :integer
  	add_column :tag_assignments, :tag_id, :integer
  	add_column :tags, :category_id, :integer

  	remove_column :projects, :companyID
  	remove_column :clients, :companyID
  	remove_column :evidences, :projectID
  	remove_column :tag_assignments, :evidenceID
  	remove_column :tag_assignments, :tagID
  	remove_column :tags, :categoryID
  end
end
