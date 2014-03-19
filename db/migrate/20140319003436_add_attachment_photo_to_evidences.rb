class AddAttachmentPhotoToEvidences < ActiveRecord::Migration
  def self.up
    change_table :evidences do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :evidences, :photo
  end
end
