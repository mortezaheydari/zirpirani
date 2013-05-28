class AddAttachmentImageToMeems < ActiveRecord::Migration
  def self.up
    change_table :meems do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :meems, :image
  end
end
