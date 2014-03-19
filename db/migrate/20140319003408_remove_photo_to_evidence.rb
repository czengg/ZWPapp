class RemovePhotoToEvidence < ActiveRecord::Migration
  def change
    remove_column :evidences, :photo, :string
  end
end
