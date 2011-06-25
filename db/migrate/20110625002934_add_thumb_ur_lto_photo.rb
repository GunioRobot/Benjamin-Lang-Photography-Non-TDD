class AddThumbUrLtoPhoto < ActiveRecord::Migration
  def self.up
  	add_column :photos, :thumb_url, :text
  end

  def self.down
  	remove_column :photos, :thumb_url
  end
end
