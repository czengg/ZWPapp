class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.int :companyID
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
