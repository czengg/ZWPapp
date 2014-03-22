class AddingReportModels < ActiveRecord::Migration
  def change
  	create_table :reports do |t|
      t.string :name
	  t.integer :project_id
	  t.boolean :active

      t.timestamps
    end

    create_table :paragraphs do |t|
      t.string :section_name
      t.string :body_text
      t.boolean :active
      t.integer :report_id

      t.timestamps
    end

    create_table :paragraphAssignment do |t|
      t.integer :report_id
      t.integer :paragraph_id
      t.boolean :active

      t.timestamps
  end
  end
end
