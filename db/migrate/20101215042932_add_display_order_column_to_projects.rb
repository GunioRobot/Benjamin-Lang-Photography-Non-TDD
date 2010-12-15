class AddDisplayOrderColumnToProjects < ActiveRecord::Migration
  def self.up
  	add_column :projects, :display_order, :integer
  	temp_order = 0
  	Project.find(:all, :order => 'created_at').each do |proj|
  		proj.display_order = temp_order
  		proj.save
  		temp_order += 1
  	end
  end

  def self.down
  	remove_column :projects, :display_order
  end
end
