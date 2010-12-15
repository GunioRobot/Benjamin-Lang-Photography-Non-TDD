class AddOrderColumnToProjectTypes < ActiveRecord::Migration
  def self.up
  	add_column :project_types, :display_order, :integer
  	temp_order = 0
  	ProjectType.find(:all, :order => 'created_at').each do |pt|
  		pt.display_order = temp_order
  		pt.save
  		temp_order += 1
  	end
  end

  def self.down
  	remove_column :project_types, :display_order
  end
end
