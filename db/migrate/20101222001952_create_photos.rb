class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.string :img_url
      t.integer :display_order
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
